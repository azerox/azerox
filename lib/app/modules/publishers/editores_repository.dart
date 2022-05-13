import 'package:dio/dio.dart';
import 'package:get/get.dart';


import '../../app_controller.dart';

class EditoresRepository {
  final Dio dio;
  EditoresRepository(this.dio);

  final user = Get.find<AppController>().currentUser;


}
