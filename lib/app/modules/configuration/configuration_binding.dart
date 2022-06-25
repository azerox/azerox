import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/modules/configuration/configuration_controller.dart';
import 'package:azerox/app/modules/configuration/configuration_user_repository.dart';
import 'package:azerox/app/modules/home/controllers/chapter_bottomsheet_controller.dart';
import 'package:azerox/app/modules/home/controllers/chapters_controller.dart';
import 'package:azerox/app/modules/home/home_controller.dart';
import 'package:azerox/app/modules/home/repositories/chapter_bottomsheet_repository.dart';
import 'package:azerox/app/modules/home/repositories/home_repository.dart';
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

    /*
    Controllers - esse trecho de código abaixo é para fazer funcionar
    a atualização da imagem do avatar
    */

    Get.lazyPut(() => HomeRepository(Get.find<Dio>()));
    Get.lazyPut(() => ChapterBottomsheetRepository(Get.find<Dio>()));

    Get.lazyPut(() => ChaptersController(Get.find<HomeRepository>()));
    Get.lazyPut(() => ChapterBottomsheetController.chapter(
          Get.find<ChaptersController>().removeItemById,
          Get.find<ChapterBottomsheetRepository>(),
        ));
    Get.put(
      HomeController(Get.find<HomeRepository>(), Get.find<AppController>()),
      permanent: true,
    );
  }
}
