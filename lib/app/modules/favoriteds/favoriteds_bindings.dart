import 'package:get/get.dart';
import './favoriteds_controller.dart';

class FavoritedsBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(FavoritedsController());
    }
}