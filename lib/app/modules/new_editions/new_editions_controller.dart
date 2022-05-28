import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/post.dart';
import 'package:flutter/foundation.dart';

import 'new_editions_repository.dart';

class NewEditionsController extends PaginationController<Post> {
  final NewEditionsRepository repository;
  NewEditionsController(this.repository);

  @protected
  @override
  Future<List<Post>> getCurrentPageItems(int page) async {
    return await repository.getNewEditions(page);
  }

  void onAddCommentCallback(Post newComment) {
    refreshItems();
  }
}
