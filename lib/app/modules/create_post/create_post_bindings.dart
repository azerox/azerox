import 'package:azerox/app/modules/create_post/create_post_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'create_post_controller.dart';

class CreatePostBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CreatePostRepository(Get.find<Dio>()));
    Get.put(CreatePostController(Get.find<CreatePostRepository>()));
  }
}
