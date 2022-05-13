import 'package:azerox/app/modules/publishers/editores_controller.dart';
import 'package:azerox/app/modules/publishers/editores_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


class EditoresBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditoresRepository(Get.find<Dio>()));
    Get.put(EditoresController(Get.find<EditoresRepository>()), permanent: true);
  }
}
