import 'package:azerox/app/models/editor_model.dart';
import 'package:azerox/app/modules/home/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_social_content_share/flutter_social_content_share.dart';

import '../../models/post.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController(this.repository);

  final searchDrawerEC = TextEditingController();

  @override
  void onClose() {
    searchDrawerEC.dispose();
    super.onClose();
  }

  Future<List<Post>> getAlbum([bool isFavoritedPage = false]) async {
    final response =
        await repository.getAlbum(isFavoritedPage: isFavoritedPage);
    return response;
  }

  Future<void> favoritePost(Post post, [bool isLike = true]) async {
    await repository.favoritePost(post, isLike);
  }

  Future<void> sendToInstagram(String imageUrl) async {
    await FlutterSocialContentShare.share(
      type: ShareType.instagramWithImageUrl,
      imageUrl: imageUrl,
    );
  }

  Future<void> sendToFacebook(String imageUrl) async {
    await FlutterSocialContentShare.share(
      type: ShareType.facebookWithoutImage,
      url: imageUrl,
      quote: '#Azerox',
    );
  }

  Future<List<EditorModel>> searchByUser() async {
    return await repository.searchByUser(searchDrawerEC.text);
  }
}
