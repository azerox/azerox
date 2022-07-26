
import 'package:azerox/app/models/user.dart';
import 'package:azerox/app/modules/home/controllers/user_pagination_controller.dart';
import 'package:flutter/foundation.dart';
import '../repositories/home_repository.dart';

class UserChaptersController extends UserPaginationController<UserModel> {
  final HomeRepository repository;
  UserChaptersController(this.repository);

  @protected
  @override
  Future<List<UserModel>> getCurrentPageItems(int page) async {
    try {
      final userModel = await repository.searchByUserPage(page: page);
      return userModel;
    } catch (ex, stack) {
      rethrow;
    }
  }

  void removeChapterById(int chapterId) {
    final newList = value.itemsList?.toList();
    newList?.removeWhere((chapter) => chapter.codUser == chapterId);
    value = value.copyWith(itemsList: newList);
  }

  void onAddCommentCallback(UserModel newComment) {
    refreshItems();
  }
}
