import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/editor_model.dart';
import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/models/social_networks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'visited_house_repository.dart';

class VisitedHouseController extends PaginationController<Post> {
  final VisitedHouseRepository repository;

  VisitedHouseController(this.repository);

  final searchDrawerEC = TextEditingController();

  @protected
  @override
  Future<List<Post>> getCurrentPageItems(int page) async {
    return await repository.getNewEditions(page);
  }

  void onAddCommentCallback(Post newComment) {
    refreshItems();
  }

  Future<List<Post>> getAlbum() async {
    final posts = await repository.getAlbum(page: 1);
    return posts;
  }

  Future<List<EditorModel>> searchByUser() async {
    return await repository.searchByUser("Antonio");
  }

  Future<List<SocialNetworks>> findSocialNetworks() async {
    return await repository.getSocialNetworks();
  }
}
