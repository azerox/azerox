import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/models/user.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ConfigurationRepository extends GetConnect {
  final Dio dio;
  ConfigurationRepository(this.dio);

  final user = Get.find<AppController>().currentUser.value;

  Future<List<String>> validCreateAccount({
    required String email,
    required String profile,
  }) async {
    var result = <String>[];
    var res = await dio.get(
      '/jsonusers.asmx/GetExists',
      queryParameters: {'Email': email, 'PublicProfile': profile},
    );

    if (res.data['EmailExists']) result.add('Email já existe');
    if (res.data['PublicProfileExists']) result.add('Perfil já existe');

    return result;
  }

  Future<UserModel> cadastroWithEmail({
    required String codUser,
    required String country,
    required String? city,
    required String? state,
    required String nickName,
    required String name,
    required String password,
    required String profile,
  }) async {
    final response = await dio.get(
      "/jsonusers.asmx/UpdateUserCompact",
      queryParameters: {
        'CodUserType': 1,
        'CodCountry': country,
        'CodCity': city,
        'CodState': state,
        'Name': name,
        'Nick': nickName,
        'PublicProfile': profile,
        'PassWord': password,
      },
    );

    final user = UserModel.fromJson(response.data["Return"]);
    user.password = password;
    return user;
  }

  Future<List<UserModel>> getUser() async {
    final response = await dio.get(
      "/jsonusers.asmx/UpdateUserCompact",
      queryParameters: {
        'sessionId': user.sessionID,
        'CodUserProfile': '${user.codUser!}',
        'CodUserLogged': '${user.codUser!}',
      },
    );

    final body = response.data['ListPosts'] as List;
    return body.map((post) => UserModel.fromJson(post)).toList();
  }
}
