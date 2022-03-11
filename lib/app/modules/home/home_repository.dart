import 'package:azerox/app/config/app_constants.dart';
import 'package:azerox/app/models/editor_model.dart';
import 'package:azerox/app/models/post.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';

class HomeRepository {
  final Dio dio;
  HomeRepository(this.dio);

  final user = Get.find<AppController>().currentUser;

  Future<List<Post>> getAlbum(
      {bool isFavoritedPage = false, bool isNewEdition = false}) async {
    dio.options.headers['Cookie'] = 'ASP.NET_SessionId=${user.sessionID}';

    final response = await dio.get(
      isFavoritedPage ? AppConstants.apiFavoritedsPost : AppConstants.apiPosts,
      queryParameters: {
        'sessionId': user.sessionID,
        'CodUserProfile': '${user.codUser!}',
        'CodUserLogged': '${user.codUser!}',
        'Page': '1',
        'pagesize': '10',
        'myPostOnly': isFavoritedPage ? 'true' : 'false',
      },
    );

    final body = response.data['ListPosts'] as List;
    return body.map((post) => Post.fromJson(post)).toList();
  }

  Future<void> favoritePost(Post post, [bool isLike = true]) async {
    dio.options.headers['Cookie'] = 'ASP.NET_SessionId=${user.sessionID}';

    await dio.get(
      isLike ? AppConstants.apiFavoritePost : AppConstants.apiDislikePost,
      queryParameters: {
        'sessionId': user.sessionID,
        'CodUser': '${user.codUser}',
        'CodPost': '${post.codPost}',
      },
    );
  }

  Future<List<EditorModel>> searchByUser(String userStr) async {
    dio.options.headers['Cookie'] = 'ASP.NET_SessionId=${user.sessionID}';

    final response = await dio.get(
      AppConstants.apiGetPUserBySearch,
      queryParameters: {
        'sessionId': user.sessionID,
        'CodUserProfile': '${user.codUser!}',
        'CodUserLogged': '${user.codUser!}',
        'Page': '1',
        'Pagesize': '10',
        'Personal': true,
        'WordSearch': userStr,
      },
    );

    return (response.data['ListFriends'] as List)
        .map((user) => EditorModel.fromJson(user))
        .toList();
  }
}
