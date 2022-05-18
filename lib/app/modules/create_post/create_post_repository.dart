import 'dart:io';

import 'package:azerox/app/app_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

import '../../config/app_constants.dart';
import '../../models/post.dart';

class CreatePostRepository {
  final Dio dio;
  CreatePostRepository(this.dio);

  Future<String> sendAudio(String? mp3) async {
    final formData = FormData.fromMap({
      "": await MultipartFile.fromFile((mp3!), filename: mp3),
    });

    final response = await dio.post(
      AppConstants.apiUploadMp3,
      data: formData,
    );
    return response.data;
  }

  Future<String?> sendImage(String? image) async {
    final formData = FormData.fromMap({
      "": await MultipartFile.fromFile((image!), filename: image),
    });

    final response = await dio.post(
      AppConstants.apiUploadImage,
      data: formData,
    );
    return response.data;
  }

  Future<Post> createPost({
    required String content,
    required String title,
    required String date,
    String? mp3,
    String? image,
  }) async {
    final user = Get.find<AppController>().currentUser;
    dio.options.headers['Cookie'] = 'ASP.NET_SessionId=${user.sessionID}';
    dio.options.headers['Content-Type'] = 'multipart/form-data;';
    String? imageResponse;
    String? audioUrl;

    if (image != null && image != '') {
      imageResponse = await sendImage(image);
    }
    if (mp3 != null && mp3 != '') {
      final audioResponse = await sendAudio(mp3);
      audioUrl = audioResponse
          .replaceAll('http://s.azerox.com.br/Audios/', '')
          .replaceAll('https://s.azerox.com.br/Audios/', '');
    }

    final response = await dio.get(
      AppConstants.apiInsertPost,
      queryParameters: {
        'sessionId': user.sessionID,
        'CodUser': '${user.codUser!}',
        'nameEvent': title,
        'dateEvent': date,
        'Post': content,
        'MP3': audioUrl ?? '',
        'Image': imageResponse?.substring(47) ?? '',
      },
    );

    return Post.fromJson(response.data);
  }
}
