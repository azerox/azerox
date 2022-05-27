import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/config/app_constants.dart';
import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/models/user.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FavoritedsRepository {
  final Dio dio;
  FavoritedsRepository(this.dio);

  UserModel get user => Get.find<AppController>().currentUser.value;

  Future<List<Post>> getAlbum({
    bool isNewEdition = false,
    required int page,
  }) async {
    dio.options.headers['Cookie'] = 'ASP.NET_SessionId=${user.sessionID}';

    final response = await dio.get(
      AppConstants.apiFavoritedsPost,
      queryParameters: {
        'sessionId': user.sessionID,
        'CodUserProfile': '${user.codUser!}',
        'CodUserLogged': '${user.codUser!}',
        'Page': page,
        'pagesize': '10',
        'myPostOnly': 'true',
      },
    );

    final body = response.data['ListPosts'] as List;
    return body.map((post) => Post.fromJson(post)).toList();
  }
}
