import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/modules/create_post/create_post_repository.dart';
import 'package:azerox/app/modules/home/controllers/chapter_bottomsheet_controller.dart';
import 'package:azerox/app/modules/home/controllers/post_chapters_controller.dart';
import 'package:azerox/app/modules/home/home_controller.dart';
import 'package:azerox/app/modules/home/repositories/chapter_bottomsheet_repository.dart';
import 'package:azerox/app/modules/home/repositories/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'create_post_controller.dart';

class CreatePostBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CreatePostRepository(Get.find<Dio>()));
    Get.put(CreatePostController(Get.find<CreatePostRepository>()));

    /*
    Controllers - esse trecho de código abaixo é para fazer funcionar
    a atualização da imagem do avatar
    */
    Get.lazyPut(() => HomeRepository(Get.find<Dio>()));
    Get.lazyPut(() => ChapterBottomsheetRepository(Get.find<Dio>()));

    Get.lazyPut(() => PostChaptersController(Get.find<HomeRepository>()));
    Get.lazyPut(() => ChapterBottomsheetController.chapter(
          Get.find<PostChaptersController>().removeItemById,
          Get.find<ChapterBottomsheetRepository>(),
        ));
    Get.put(
      HomeController(Get.find<HomeRepository>(), Get.find<AppController>()),
      permanent: true,
    );
  }
}
