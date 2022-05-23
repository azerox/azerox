import 'package:dio/dio.dart';
import 'package:get/get.dart';


import '../../app_controller.dart';

class MMNRepository {
  final Dio dio;
  MMNRepository(this.dio);

  final user = Get.find<AppController>().currentUser;


}
