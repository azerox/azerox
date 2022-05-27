import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/post.dart';
import 'package:flutter/foundation.dart';

import 'favoriteds_repository.dart';

class FavoritedsController extends PaginationController<Post> {
  final FavoritedsRepository repository;
  FavoritedsController(this.repository);

  @protected
  @override
  Future<List<Post>> getCurrentPageItems() async {
    final posts = await repository.getAlbum(page: value.page);
    return posts;
  }
}
