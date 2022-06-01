import 'package:azerox/app/modules/home/controllers/chapter_bottomsheet_controller.dart';
import 'package:azerox/app/modules/home/repositories/chapter_bottomsheet_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import './new_editions_controller.dart';
import 'new_editions_repository.dart';

class NewEditionsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewEditionsRepository(Get.find<Dio>()));
    Get.lazyPut(() => ChapterBottomsheetRepository(Get.find<Dio>()));
    Get.put(NewEditionsController(Get.find<NewEditionsRepository>()));
    Get.lazyPut(() => ChapterBottomsheetController.chapter(
          Get.find<NewEditionsController>().removeItemById,
          Get.find<ChapterBottomsheetRepository>(),
        ));
  }
}
