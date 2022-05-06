import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';
import '../../config/app_routes.dart';
import 'login_repository.dart';

class LoginController extends GetxController {
  final LoginRepository repository;
  LoginController(this.repository);

  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // emailEC.text = 'teste.azerox@gmail.com';
    // passwordEC.text = 'azeroxtestes@';

    // emailEC.text = 'gontijo@azerox.com.br';
    // passwordEC.text = '@ANT05024260';

    // emailEC.text = 'cjrondini@gmail.com';
    // passwordEC.text = '1980';

    emailEC.text = 'demo@azerox.com.br';
    passwordEC.text = '123456da';

    // emailEC.text = 'antonio@tangum.com.br';
    // passwordEC.text = 'militao';
  }

  Future loginWithEmail(String email, String password) async {
    try {
      isLoading.value = true;
      final user = await repository.loginWithEmail(
        email.trim(),
        password.trim(),
      );
      Get.find<AppController>().currentUser = user;
      isLoading.value = false;
      Get.offAllNamed(Routes.home);
    } catch (e) {
      isLoading.value = false;
      throw 'E-mail e/ou senha inválidos.';
    }
  }
}
