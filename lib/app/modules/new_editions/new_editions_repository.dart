import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';
import '../../config/app_constants.dart';
import '../../models/post.dart';

class NewEditionsRepository {
  final Dio dio;
  NewEditionsRepository(this.dio);

  final user = Get.find<AppController>().currentUser;

  Future<List<Post>> getNewEditions() async {
    dio.options.headers['Cookie'] = 'ASP.NET_SessionId=${user.sessionID}';

    final response = await dio.get(
      AppConstants.apiGetPostsByUser,
      queryParameters: {
        'sessionId': user.sessionID,
        'CodUserProfile': '${user.codUser!}',
        'CodUserLogged': '${user.codUser!}',
        'Page': '1',
        'pagesize': '10',
        'myPostOnly': 'false',
      },
    );

    final body = response.data['ListPosts'] as List;
    return body.map((post) => Post.fromJson(post)).toList();
  }
}
