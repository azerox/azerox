import 'package:get/get.dart';
import './comments_controller.dart';

class CommentsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CommentsController());
  }
}
