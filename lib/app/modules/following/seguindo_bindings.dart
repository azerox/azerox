import 'package:azerox/app/modules/following/seguindo_controller.dart';
import 'package:azerox/app/modules/following/seguindo_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


class SeguindoBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SeguindoRepository(Get.find<Dio>()));
    Get.put(SeguindoController(Get.find<SeguindoRepository>()), permanent: true);
  }
}
