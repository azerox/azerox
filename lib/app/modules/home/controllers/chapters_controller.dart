import 'package:azerox/app/models/post.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../home_repository.dart';

class ChaptersController extends ValueNotifier<ChapterState> {
  final HomeRepository repository;
  ChaptersController(this.repository) : super(ChapterState.empty);

  void _setLoading(bool isLoading) {
    value = value.copyWith(isLoading: isLoading);
  }

  Future<void> refreshChapters() async {
    value = ChapterState.empty;
    final chaptersList = await getCurrentPageChapters();
    value = value.copyWith(chaptersList: chaptersList);
  }

  Future<void> loadMoreChapters() async {
    if (value.chaptersList == null) return refreshChapters();
    if (value.isLoading) return;

    try {
      _setLoading(true);
      final currentPageChapters = await getCurrentPageChapters();
      final newChaptersList = value.chaptersList! + currentPageChapters;
      value = value.copyWith(chaptersList: newChaptersList);
    } catch (ex, stack) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  @protected
  Future<List<Post>> getCurrentPageChapters() async {
    final posts = await repository.getAlbum(
      isFavoritedPage: false,
      page: value.page,
    );
    value = value.copyWith(page: value.page + 1);
    return _filterNonFuturePosts(posts);
  }

  List<Post> _filterNonFuturePosts(List<Post> posts) {
    final filteredPosts = posts.where((post) {
      if (post.dateEventString == null) return true;
      final format = DateFormat('dd/MM/yyyy');
      final dateEvent = format.parse(post.dateEventString!);
      final todayLastMinute = format
          .parse(format.format(DateTime.now()))
          .add(const Duration(days: 1))
          .subtract(const Duration(seconds: 1));
      return dateEvent.isBefore(todayLastMinute);
    }).toList();

    return filteredPosts;
  }
}

class ChapterState {
  final List<Post>? chaptersList;
  final bool isLoading;
  final int page;

  ChapterState({
    required this.chaptersList,
    required this.isLoading,
    required this.page,
  });

  static ChapterState empty = ChapterState(
    chaptersList: null,
    isLoading: false,
    page: 1,
  );

  ChapterState copyWith({
    List<Post>? chaptersList,
    bool? isLoading,
    int? page,
  }) {
    return ChapterState(
      chaptersList: chaptersList ?? this.chaptersList,
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChapterState &&
        listEquals(other.chaptersList, chaptersList) &&
        other.isLoading == isLoading &&
        other.page == page;
  }

  @override
  int get hashCode =>
      chaptersList.hashCode ^ isLoading.hashCode ^ page.hashCode;

  @override
  String toString() =>
      'ChapterState(chaptersList: $chaptersList, isLoading: $isLoading)';
}
