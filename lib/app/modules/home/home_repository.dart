import 'dart:io';

import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/models/assinante_model.dart';
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

  UserModel get user =>
      Get
          .find<AppController>()
          .currentUser
          .value;

  AssinanteModel get assinante =>
      Get
          .find<AppController>()
          .currentAssinante
          .value;



  Future<AssinanteModel?> localizaAssinante({
    required int codUser,
  }) async {
    dio.options.headers['Cookie'] = 'ASP.NET_SessionId=${user.sessionID}';

    final response = await dio.get(
      AppConstants.apiAssinante,
      queryParameters: {
        'sessionId': user.sessionID,
        'CodUser': codUser,
      },
    );
    return AssinanteModel(
      codUser: assinante.codUser,
      sessionID: assinante.sessionID,
    );
  }


  Future<List<Post>> getAlbum({
    bool isFavoritedPage = false,
    bool isNewEdition = false,
    required int page,
  }) async {
    dio.options.headers['Cookie'] = 'ASP.NET_SessionId=${user.sessionID}';

    final response = await dio.get(
      isFavoritedPage ? AppConstants.apiFavoritedsPost : AppConstants.apiPosts,
      queryParameters: {
        'sessionId': user.sessionID,
        'CodUserProfile': '${user.codUser!}',
        'CodUserLogged': '${user.codUser!}',
        'Page': page,
        'pagesize': '10',
        'myPostOnly': isFavoritedPage ? 'true' : 'false',
      },
    );

    final body = response.data['ListPosts'] as List;
    return body.map((post) => Post.fromJson(post)).toList();
  }

  Future<void> favoritePost(Post post, [bool isLike = true]) async {
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

  Future<String?> sendProfileImage(String imageFilePath) async {
    dio.options.headers['Content-type'] = 'multipart/form-data;';
    final formData = FormData.fromMap({
      "": await MultipartFile.fromFile(
        imageFilePath,
        filename: 'profile_image.jpg',
      ),
    });

    final response = await dio.post(
      AppConstants.apiUploadProfileImage,
      data: formData,
    );
    return response.data;
  }

  Future<UserProfile?> uploadProfilePicture(String imagePath) async {
    String? imageResponse;
    imageResponse = await sendProfileImage(imagePath);
    if (imageResponse == null) return null;

    final response = await dio.get(
      AppConstants.apiSaveImageProfile,
      queryParameters: {
        'CodUser': '${user.codUser!}',
        'FilePicture': cropImagePath(imageResponse),
      },
    );
    return UserProfile(
      codUser: user.codUser,
      sessionID: user.sessionID,
      filePicture: imageResponse,
    );
  }

  String cropImagePath(String fullUrl) {
    final uri = Uri.parse(fullUrl);
    final path =
        uri.pathSegments.sublist(uri.pathSegments.length - 3).join('/');
    return path;
  }

}
