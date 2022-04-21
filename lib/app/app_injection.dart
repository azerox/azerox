import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'app_controller.dart';

class AppInjection implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio(BaseOptions(baseUrl: "https://azerox.com.br/services")));
    Get.put(AppController(), permanent: true);
  }
}
