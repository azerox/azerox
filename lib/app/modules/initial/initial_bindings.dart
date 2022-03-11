import 'package:dio/dio.dart';
import 'package:get/get.dart';
import './initial_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(InitialController(Get.find<Dio>()));
  }
}
