import 'package:azerox/app/modules/home/repositories/chapter_bottomsheet_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'controllers/specific_comments_controller.dart';
import 'controllers/specific_create_comment_controller.dart';
import 'repositories/specific_comments_repository.dart';

class SpecificCommentsBindings implements Bindings {
  @override
  void dependencies() {
    //Repositories
    Get.lazyPut(() => SpecificCommentsRepository(Get.find<Dio>()));
    Get.lazyPut(() => ChapterBottomsheetRepository(Get.find<Dio>()));

    //Controllers
    Get.lazyPut(() => SpecificCommentsController(Get.find<SpecificCommentsRepository>()));
    Get.lazyPut(() => SpecificCreateCommentController(Get.find<SpecificCommentsRepository>()));
  }
}
