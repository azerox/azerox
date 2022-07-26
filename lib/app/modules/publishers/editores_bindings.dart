import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/modules/home/controllers/chapter_bottomsheet_controller.dart';
import 'package:azerox/app/modules/home/controllers/post_chapters_controller.dart';
import 'package:azerox/app/modules/home/home_controller.dart';
import 'package:azerox/app/modules/home/repositories/chapter_bottomsheet_repository.dart';
import 'package:azerox/app/modules/home/repositories/home_repository.dart';
import 'package:azerox/app/modules/publishers/controllers/chapter_bottomsheet_editor_controller.dart';
import 'package:azerox/app/modules/publishers/controllers/chapters_Publisher_controller.dart';
import 'package:azerox/app/modules/publishers/controllers/editores_controller.dart';
import 'package:azerox/app/modules/publishers/repository/chapter_bottomsheet_repository.dart';
import 'package:azerox/app/modules/publishers/repository/editores_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class EditoresBindings implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => EditoresRepository(Get.find<Dio>()));

    Get.lazyPut(() => ChapterBottomsheetEditorRepository(Get.find<Dio>()));

    Get.lazyPut(
        () => ChaptersPublisherController(Get.find<EditoresRepository>()));
    Get.lazyPut(() => ChapterBottomsheetEditorController.chapter(
      Get.find<ChaptersPublisherController>().removeItemById,
      Get.find<ChapterBottomsheetEditorRepository>(),
    ));
    Get.lazyPut(() => EditoresController(Get.find<EditoresRepository>()));



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
