import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'app_controller.dart';

class AppInjection implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put(AppController(), permanent: true);
  }
}
