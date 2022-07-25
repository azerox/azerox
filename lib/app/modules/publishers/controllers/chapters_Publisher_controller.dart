import 'package:azerox/app/modules/publishers/controllers/editor_pagination_controller.dart';
import 'package:azerox/app/models/new_editor.dart';
import 'package:azerox/app/modules/publishers/repository/editores_repository.dart';
import 'package:flutter/foundation.dart';

class ChaptersPublisherController extends EditorPaginationController<NewEditor> {
  final EditoresRepository repository;
  ChaptersPublisherController(this.repository);



  @protected
  @override
  Future<List<NewEditor>> getCurrentPageItems(int page) async {
    try {
      final newEditor = await repository.getListApprovedFriends(page: page);
      return newEditor;
    } catch (ex, stack) {
      rethrow;
    }
  }

  void onAddCommentCallback(NewEditor newComment) {
    refreshItems();
  }

}
