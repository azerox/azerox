import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/config/app_constants.dart';
import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/models/user.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class CommentsRepository {
  final Dio dio;
  CommentsRepository(this.dio);

  UserModel get user => Get.find<AppController>().currentUser.value;

  Future<List<Post>> getComments(int chapterId) async {
    final response = await dio.get(
      AppConstants.apiPostOnly,
      queryParameters: {
        'CodPost': chapterId,
      },
    );

    final items = Post.fromJson(response.data);
    return items.listRepost ?? [];
  }

  Future<Post> getChapterById(int chapterId) async {
    final response = await dio.get(
      AppConstants.apiPostOnly,
      queryParameters: {
        'CodPost': chapterId,
      },
    );

    final items = Post.fromJson(response.data);
    return items;
  }

  Future<AttachedUriValue?> sendAudio(String? mp3) async {
    final formData = FormData.fromMap({
      "": await MultipartFile.fromFile((mp3!), filename: mp3),
    });

    final response = await dio.post(
      AppConstants.apiUploadMp3,
      data: formData,
    );
    return AttachedUriValue.fromUrl(response.data);
  }

  Future<AttachedUriValue?> sendImage(String? image) async {
    final formData = FormData.fromMap({
      "": await MultipartFile.fromFile((image!), filename: image),
    });

    final response = await dio.post(
      AppConstants.apiUploadImage,
      data: formData,
    );
    return AttachedUriValue.fromUrl(response.data);
  }

  Future<Post> createComment({
    required String content,
    String? mp3,
    String? image,
    int? masterChapterId,
  }) async {
    final user = Get.find<AppController>().currentUser.value;
    AttachedUriValue? imageUri;
    AttachedUriValue? audioUri;

    if (image != null && image != '') {
      imageUri = await sendImage(image);
    }
    if (mp3 != null && mp3 != '') {
      audioUri = await sendAudio(mp3);
    }
    final response = await dio.get(
      AppConstants.apiInsertCommentPost,
      queryParameters: {
        'CodUser': '${user.codUser!}',
        'Post': content,
        'MP3': audioUri?.path ?? '',
        'Image': imageUri?.path ?? '',
        'CodPostMaster': masterChapterId?.toString() ?? '',
      },
    );
    return Post.fromJson(response.data);
  }
}
