import 'dart:io';

import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/models/editor_model.dart';
import 'package:azerox/app/models/user.dart';
import 'package:azerox/app/models/user_profile.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:path_provider/path_provider.dart';

import '../../config/app_constants.dart';
import '../../models/post.dart';

class HomeRepository {
  final Dio dio;
  HomeRepository(this.dio);

  UserModel get user => Get.find<AppController>().currentUser;

  Future<List<Post>> getAlbum({
    bool isFavoritedPage = false,
    bool isNewEdition = false,
  }) async {
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

  Future<String> downloadAudioFile(String audioUrl) async {
    dio.options.headers['Cookie'] = 'ASP.NET_SessionId=${user.sessionID}';

    final uri = Uri.parse(audioUrl);
    final fileName = uri.pathSegments.last.replaceAll('.mp3', '');
    final tempFolder = await getTemporaryDirectory();
    final filePath = '$tempFolder/$fileName';
    File(filePath).openWrite();
    try {
      final response = await dio.download(audioUrl, filePath);

      print('File Download Respose: $response');
      return filePath;
    } catch (ex, stack) {
      print(ex);
      rethrow;
    }
  }

  Future<String?> sendImage(String? image) async {
    final formData = FormData.fromMap({
      "": await MultipartFile.fromFile((image!), filename: image),
    });

    final response = await dio.post(
      AppConstants.apiUploadImage,
      data: formData,
      options: Options(
        contentType: 'multipart/form-data;',
        headers: {'Cookie': 'ASP.NET_SessionId=${user.sessionID}'},
      ),
    );
    return response.data;
  }

  Future<UserProfile?> uploadProfilePicture(String imagePath) async {
    String? imageResponse;
    // https://s.azerox.com.br/Images/Users/Profiles/Max/https://s.azerox.com.br/Images/Users/Photos/Min/2022/5/20220518164742651.jpg"
    imageResponse = await sendImage(imagePath);
    if (imageResponse == null) return null;

    final response = await dio.get(
      AppConstants.apiUploadImageProfile,
      queryParameters: {
        'sessionId': user.sessionID,
        'CodUser': '${user.codUser!}',
        'FilePicture': imageResponse.substring(47),
      },
      options: Options(
        headers: {'Cookie': 'ASP.NET_SessionId=${user.sessionID}'},
      ),
    );
    return UserProfile(
      codUser: user.codUser,
      sessionID: user.sessionID,
      filePicture: imageResponse,
    );
  }
}
