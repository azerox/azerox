
import 'package:azerox/app/modules/cadastro/cadastro_email_controller.dart';
import 'package:azerox/app/modules/cadastro/cadastro_email_repository.dart';
import 'package:azerox/app/modules/repositories/ibge_repository.dart';
import 'package:azerox/app/modules/repositories/ibge_repository_imp.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CadastroEmailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CadastroEmailRepository(Get.find<Dio>()));
    Get.put<IBGERepository>(IBGERepositoryImp(httpClient: Get.find()));
    Get.put(CadastroEmailController(
      ibgeRepository: Get.find(),
      loginRepository: Get.find(),
    ));
  }
}
