import 'package:azerox/app/modules/comments/account/infinite/infinite_comments_controller.dart';
import 'package:azerox/app/modules/comments/account/infinite/infinite_comments_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


class InfiniteCommentsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfiniteCommentsRepository(Get.find<Dio>()));
    Get.put(InfiniteCommentsController(Get.find<InfiniteCommentsRepository>()), permanent: true);
  }
}
