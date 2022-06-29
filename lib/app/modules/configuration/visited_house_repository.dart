import 'package:azerox/app/models/editor_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';
import '../../config/app_constants.dart';
import '../../models/post.dart';

class VisitedHouseRepository {
  final Dio dio;
  VisitedHouseRepository(this.dio);

  final user = Get.find<AppController>().currentUser.value;

  Future<List<Post>> getNewEditions(int page) async {
    dio.options.headers['Cookie'] = 'ASP.NET_SessionId=${user.sessionID}';

    final response = await dio.get(
      AppConstants.apiGetPostsByUser,
      queryParameters: {
        'sessionId': user.sessionID,
        'CodUserProfile': '${user.codUser!}',
        'CodUserLogged': '${user.codUser!}',
        'Page': page,
        'pagesize': '10',
        'myPostOnly': 'false',
      },
    );

    final body = response.data['ListPosts'] as List;
    return body.map((post) => Post.fromJson(post)).toList();
  }


  Future<List<Post>> getAlbum({
    bool isNewEdition = false,
    required int page,
  }) async {
    dio.options.headers['Cookie'] = 'ASP.NET_SessionId=${user.sessionID}';

    final response = await dio.get(
      AppConstants.apiPosts,
      queryParameters: {
        'sessionId': user.sessionID,
        'CodUserProfile': '${user.codUser!}',
        'CodUserLogged': '${user.codUser!}',
        'Page': page,
        'pagesize': '10',
        'myPostOnly': 'false',
      },
    );

    final body = response.data['ListPosts'] as List;
    return body.map((post) => Post.fromJson(post)).toList();
  }


  Future<List<EditorModel>> searchByUser(String userStr) async {
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
