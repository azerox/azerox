import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';
import '../../config/app_constants.dart';
import '../../config/app_routes.dart';
import '../../models/user.dart';

class InitialController extends GetxController {
  final Dio dio;
  InitialController(this.dio);

  // Future<void> registerViaFacebook(UserModel user) async {
  //   dio.options.headers['Cookie'] =
  //       'ASP.NET_SessionId=krtsvimtvhumftlzsrlu31sd';

  //   await dio.get(
  //     AppConstants.apiRegister,
  //     queryParameters: {
  //       "CodUserType": '1',
  //       "Country": 'Brasil',
  //       "City": 'São Paulo',
  //       "State": 'SP',
  //       "Name": user.name,
  //       "Nick": user.name[0] + user.name[1],
  //       "BirthDay": '09',
  //       "BirthMonth": '02',
  //       "BirthYear": '2001',
  //       "Email": user.email,
  //       "ZipCode": '58055270',
  //       "Password": user.password,
  //       "PublicProfile": 'eu',
  //     },
  //   );

  //   log('Cadastrado no Azerox Via Facebook');
  // }

  Future<UserModel?> getUserByEmail(String email) async {
    dio.options.headers['Cookie'] =
        'ASP.NET_SessionId=krtsvimtvhumftlzsrlu31sd';

    final response = await dio.get(
      AppConstants.apiGetUserByEmail,
      queryParameters: {'email': email},
    );

    final data = response.data['Return'];

    if (data != null) {
      final user = UserModel.fromJson(data);
      log(user.toJson().toString());
      return user;
    }
    return null;
  }

  loginWithFacebook() async {
    await FacebookAuth.instance.login();
    final user = await FacebookAuth.instance.getUserData();

    if (user.isNotEmpty) {
      final userFb = UserModel(
        email: user['email'],
        name: user['name'],
        filePicture: user['picture']['data']['url'],
      );

      final userExists = await getUserByEmail(userFb.email!);

      if (userExists != null) {
        Get.find<AppController>().currentUser = userExists;
      }
      Get.offNamed(Routes.home);
    }
  }
}
