import 'package:azerox/app/modules/configuration/configuration_controller.dart';
import 'package:azerox/app/modules/configuration/configuration_user_repository.dart';
import 'package:azerox/app/modules/register/register_email_controller.dart';
import 'package:azerox/app/modules/repositories/ibge_repository.dart';
import 'package:azerox/app/modules/repositories/ibge_repository_imp.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ConfigurationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ConfigurationRepository(Get.find<Dio>()));
    Get.put<IBGERepository>(IBGERepositoryImp(httpClient: Get.find()));
    Get.put(ConfigurationController(
      ibgeRepository: Get.find(),
      loginRepository: Get.find(),
    ));
  }
}
