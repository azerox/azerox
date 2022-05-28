import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/post.dart';
import 'package:flutter/foundation.dart';

import '../home_repository.dart';

class ChaptersController extends PaginationController<Post> {
  final HomeRepository repository;
  ChaptersController(this.repository);

  @protected
  @override
  Future<List<Post>> getCurrentPageItems(int page) async {
    try {
      final posts = await repository.getAlbum(page: page);
      return posts;
    } catch (ex, stack) {
      rethrow;
    }
  }

  void removeChapterById(int chapterId) {
    final newList = value.itemsList?.toList();
    newList?.removeWhere((chapter) => chapter.codPost == chapterId);
    value = value.copyWith(itemsList: newList);
  }

  void onAddCommentCallback(Post newComment) {
    refreshItems();
  }
}
