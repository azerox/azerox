import 'package:dio/dio.dart';
import 'package:get/get.dart';
import './new_editions_controller.dart';
import 'new_editions_repository.dart';

class NewEditionsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewEditionsRepository(Get.find<Dio>()));
    Get.put(NewEditionsController(Get.find<NewEditionsRepository>()));
  }
}
