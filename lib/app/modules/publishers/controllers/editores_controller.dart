import 'package:azerox/app/models/paged_info_new_editor.dart';
import 'package:azerox/app/modules/publishers/editores_repository.dart';
import 'package:get/get.dart';

class EditoresController extends GetxController {
  final EditoresRepository repository;

  EditoresController(this.repository);

  Future<List<PagedInfoNewEditor>> findNumberNewEditor() async {
    return await repository.getListApprovedFriendsNumber();
  }
}
