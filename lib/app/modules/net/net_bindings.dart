
import 'package:azerox/app/modules/net/net_controller.dart';
import 'package:azerox/app/modules/net/net_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


class NetBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetRepository(Get.find<Dio>()));
    Get.put(NetController(Get.find<NetRepository>()), permanent: true);
  }
}
