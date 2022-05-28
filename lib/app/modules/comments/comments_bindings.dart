import 'package:azerox/app/modules/home/repositories/chapter_bottomsheet_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'controllers/comments_controller.dart';
import 'controllers/create_comment_controller.dart';
import 'repositories/comments_repository.dart';

class CommentsBindings implements Bindings {
  @override
  void dependencies() {
    //Repositories
    Get.lazyPut(() => CommentsRepository(Get.find<Dio>()));
    Get.lazyPut(() => ChapterBottomsheetRepository(Get.find<Dio>()));

    //Controllers
    Get.lazyPut(() => CommentsController(Get.find<CommentsRepository>()));
    Get.lazyPut(() => CreateCommentController(Get.find<CommentsRepository>()));
  }
}
