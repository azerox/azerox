import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/post.dart';

import '../repositories/comments_repository.dart';

class CommentsController extends PaginationController<Post> {
  final CommentsRepository _repository;
  CommentsController(this._repository);

  int? _idChapter;
  void setChapterId(int idChapter) {
    _idChapter = idChapter;
  }

  void setCommentsList(List<Post> newList) {
    value = value.copyWith(itemsList: newList);
    print(value.itemsList);
  }

  void addNewComment(Post comment) {
    final newList = value.itemsList?.toList() ?? [];
    newList.add(comment);
    value = value.copyWith(itemsList: newList);
  }

  @override
  Future<List<Post>> getCurrentPageItems(int page) async {
    print(value.itemsList?.length);
    return value.itemsList ?? [];

    //   if (_idChapter == null) return [];
    //   final comments = await _repository.getComments(_idChapter!, page);
    //   return comments; 
  }
}
