import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/modules/configuration/visited_house_controller.dart';
import 'package:azerox/app/modules/configuration/visited_house_repository.dart';
import 'package:flutter/foundation.dart';



class VisitedHouseChaptersController extends PostPaginationController<Post> {
  final VisitedHouseRepository repository;
  VisitedHouseChaptersController(this.repository);

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
