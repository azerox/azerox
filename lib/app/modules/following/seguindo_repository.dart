import 'package:dio/dio.dart';
import 'package:get/get.dart';


import '../../app_controller.dart';

class SeguindoRepository {
  final Dio dio;
  SeguindoRepository(this.dio);

  final user = Get.find<AppController>().currentUser;


}
