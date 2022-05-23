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
    final posts = await repository.getAlbum(
      isFavoritedPage: false,
      page: value.page,
    );
    value = value.copyWith(page: value.page + 1);
    return posts;
  }
}
