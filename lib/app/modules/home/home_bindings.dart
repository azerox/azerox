import 'package:azerox/app/app_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'controllers/chapters_controller.dart';
import 'controllers/chapter_bottomsheet_controller.dart';
import 'home_controller.dart';
import 'repositories/chapter_bottomsheet_repository.dart';
import 'repositories/home_repository.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    //Repositories
    Get.lazyPut(() => HomeRepository(Get.find<Dio>()));
    Get.lazyPut(() => ChapterBottomsheetRepository(Get.find<Dio>()));
    
    //Controllers
    Get.lazyPut(() => ChaptersController(Get.find<HomeRepository>()));
    Get.lazyPut(() => ChapterBottomsheetController(
          Get.find<ChaptersController>().removeItemById,
          Get.find<ChapterBottomsheetRepository>(),
        ));
    Get.put(
      HomeController(Get.find<HomeRepository>(), Get.find<AppController>()),
      permanent: true,
    );
  }
}
