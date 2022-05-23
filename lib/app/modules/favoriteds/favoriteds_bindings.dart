import 'package:azerox/app/modules/home/home_repository.dart';
import 'package:get/get.dart';

import 'favoriteds_controller.dart';

class FavoritedsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoritedsController(Get.find<HomeRepository>()));
  }
}
