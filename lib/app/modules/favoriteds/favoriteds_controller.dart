import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/modules/home/home_repository.dart';
import 'package:flutter/foundation.dart';

class FavoritedsController extends PaginationController<Post> {
  final HomeRepository repository;
  FavoritedsController(this.repository);

  @protected
  @override
  Future<List<Post>> getCurrentPageItems() async {
    final posts = await repository.getAlbum(
      isFavoritedPage: true,
      page: value.page,
    );
    return posts;
  }
}
