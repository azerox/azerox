import 'package:dio/dio.dart';
import 'package:get/get.dart';


import '../../app_controller.dart';

class NetRepository {
  final Dio dio;
  NetRepository(this.dio);

  final user = Get.find<AppController>().currentUser;


}
