import 'package:azerox/app/modules/mmn/mmn_controller.dart';
import 'package:azerox/app/modules/mmn/mmn_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


class MMNBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MMNRepository(Get.find<Dio>()));
    Get.put(MMNController(Get.find<MMNRepository>()), permanent: true);
  }
}
