import 'package:azerox/app/models/post.dart';
import 'package:get/get.dart';

import 'new_editions_repository.dart';

class NewEditionsController extends GetxController {
  final NewEditionsRepository repository;
  NewEditionsController(this.repository);

  Future<List<Post>> getNewEditions() async {
    return await repository.getNewEditions();
  }
}
