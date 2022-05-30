import 'package:azerox/app/models/post.dart';
import 'package:flutter/material.dart';

import '../repositories/comments_repository.dart';

class CommentsController extends ValueNotifier<CommentsState> {
  final CommentsRepository _repository;
  CommentsController(this._repository) : super(CommentsState.empty);

  void setChapterId(int chapterId) {
    value = value.copyWith(chapter: Post(codPost: chapterId));
  }

  void setChapter(Post chapter) {
    value = value.copyWith(chapter: chapter);
  }

  void setCommentsList(List<Post> newList) {
    value = value.copyWith(commentsList: newList);
    print(value.commentsList);
  }

  Future<void> addNewComment(Post comment) async {
    final newList = value.commentsList?.toList() ?? [];
    newList.add(comment);
    value = value.copyWith(commentsList: newList);
    await refresh();
  }

  Future<void> removeCommentById(int commentId) async {
    final newList = value.commentsList?.toList();
    newList?.removeWhere((chapter) => chapter.codPost == commentId);
    value = value.copyWith(commentsList: newList);

    await refresh();
  }

  Future<void> refresh([int? chapterId]) async {
    try {
      chapterId ??= value.chapter?.codPost;
      if (chapterId == null) return;
      _setLoading(true);
      value = value.clearComments();
      final chapter = await _repository.getChapterById(chapterId);
      value = value.copyWith(
        chapter: chapter,
        commentsList: chapter.listRepost,
      );
    } catch (ex, stack) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool isLoading) {
    value = value.copyWith(isLoading: isLoading);
  }
}

class CommentsState {
  final Post? chapter;
  final List<Post>? commentsList;
  final bool isLoading;

  const CommentsState({
    required this.chapter,
    required this.commentsList,
    required this.isLoading,
  });

  static const empty = CommentsState(
    chapter: null,
    commentsList: null,
    isLoading: false,
  );

  CommentsState clearComments() {
    return CommentsState(
      commentsList: null,
      chapter: chapter,
      isLoading: isLoading,
    );
  }

  CommentsState copyWith({
    Post? chapter,
    List<Post>? commentsList,
    bool? isLoading,
  }) {
    return CommentsState(
      chapter: chapter ?? this.chapter,
      commentsList: commentsList ?? this.commentsList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
