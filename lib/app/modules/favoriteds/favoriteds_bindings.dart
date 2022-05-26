import 'package:azerox/app/modules/home/controllers/chapter_bottomsheet_controller.dart';
import 'package:azerox/app/modules/home/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'favoriteds_controller.dart';
import 'favoriteds_repository.dart';

class FavoritedsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoritedsRepository(Get.find<Dio>()));
    Get.lazyPut(() => HomeRepository(Get.find<Dio>()));
    Get.lazyPut(() => FavoritedsController(Get.find<FavoritedsRepository>()));
    Get.lazyPut(() => ChapterBottomsheetController(
          Get.find<FavoritedsController>(),
          Get.find<HomeRepository>(),
        ));
  }
}
