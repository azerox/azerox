import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/new_editor.dart';
import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/modules/publishers/editores_repository.dart';
import 'package:flutter/foundation.dart';

class ChaptersPublisherController extends PaginationController<NewEditor> {
  final EditoresRepository repository;
  ChaptersPublisherController(this.repository);



  @protected
  @override
  Future<List<NewEditor>> getCurrentPageItems(int page) async {
    try {
      final posts = await repository.getListApprovedFriends(page: page);
      return posts;
    } catch (ex, stack) {
      rethrow;
    }
  }

  void onAddCommentCallback(Post newComment) {
    refreshItems();
  }

}
