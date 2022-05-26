import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/post.dart';
import 'package:flutter/foundation.dart';

import '../home_repository.dart';

class ChaptersController extends PaginationController<Post> {
  final HomeRepository repository;
  ChaptersController(this.repository);

  @protected
  @override
  Future<List<Post>> getCurrentPageItems() async {
    final posts = await repository.getAlbum(page: value.page);
    return posts;
  }

  void removeChapterById(int chapterId) {
    final newList = value.itemsList?.toList();
    newList?.removeWhere((chapter) => chapter.codPost == chapterId);
    value = value.copyWith(itemsList: newList);
  }
}
