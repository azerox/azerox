import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'home_repository.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeRepository(Get.find<Dio>()));
    Get.put(HomeController(Get.find<HomeRepository>()), permanent: true);
  }
}
