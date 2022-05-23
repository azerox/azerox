import 'package:azerox/app/app_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'controllers/chapters_controller.dart';
import 'home_controller.dart';
import 'home_repository.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeRepository(Get.find<Dio>()));
    Get.lazyPut(() => ChaptersController(Get.find<HomeRepository>()));
    Get.put(
      HomeController(Get.find<HomeRepository>(), Get.find<AppController>()),
      permanent: true,
    );
  }
}
