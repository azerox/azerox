import 'package:azerox/app/config/app_constants.dart';
import 'package:azerox/app/models/user.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginRepository extends GetConnect {
  final Dio dio;
  LoginRepository(this.dio);

  Future<UserModel> loginWithEmail(String email, String password) async {
    final response = await dio.get(
      AppConstants.apiLogin,
      queryParameters: {
        'email': email,
        'PassWord': password,
        'ForceDefaultPassword': true,
        'ChoiseCredential': false,
      },
    );

    final user = UserModel.fromJson(response.data);
    user.password = password;
    return user;
  }
}
