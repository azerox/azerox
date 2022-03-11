import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'login_controller.dart';
import 'login_repository.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginRepository(Get.find<Dio>()));
    Get.put(LoginController(Get.find<LoginRepository>()));
  }
}
