import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'app_controller.dart';
import 'core/dio/custom_dio.dart';

class AppInjection implements Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(CustomDio("https://azerox.com.br/services"));
    Get.put(AppController(), permanent: true);
  }
}
