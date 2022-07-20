import 'package:azerox/app/config/app_constants.dart';
import 'package:azerox/app/models/editor_model.dart';
import 'package:azerox/app/models/new_editor.dart';
import 'package:azerox/app/models/paged_info_new_editor.dart';
import 'package:azerox/app/models/post.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


import '../../app_controller.dart';

class EditoresRepository {
  final Dio dio;

  EditoresRepository(this.dio);

  final user = Get.find<AppController>().currentUser.value;

  Future<List<NewEditor>> getListApprovedFriends({
    required int page,
  }) async {
    dio.options.headers['Cookie'] = 'ASP.NET_SessionId=${user.sessionID}';

    final response = await dio.get(
      AppConstants.apiListApprovedFriends,
      queryParameters: {
        'sessionId': user.sessionID,
        'CodUserProfile': '${user.codUser!}',
        'Page': page,
        'Pagesize': '10',
        'GetPeding': 'false',
        'Personal': 'false',
        'AllUserTypes': 'true',

      },
    );


    final body = response.data['ListFriends'] as List;
    return body.map((post) => NewEditor.fromJson(post)).toList();

  }

  Future<PagedInfoNewEditor> getListApprovedFriendsNumber() async {
    dio.options.headers['Cookie'] = 'ASP.NET_SessionId=${user.sessionID}';

    final response = await dio.get(
      AppConstants.apiListApprovedFriends,
      queryParameters: {
        'sessionId': user.sessionID,
        'CodUserProfile': '${user.codUser!}',
        'Page': 1,
        'Pagesize': '10',
        'GetPeding': 'false',
        'Personal': 'false',
        'AllUserTypes': 'true',

      },
    );


    final body = response.data['PagedInfo'];
    return PagedInfoNewEditor.fromJson(body);
  }

}