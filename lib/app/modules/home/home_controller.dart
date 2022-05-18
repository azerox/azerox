import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/config/app_routes.dart';
import 'package:azerox/app/models/editor_model.dart';
import 'package:azerox/app/models/user_profile.dart';
import 'package:azerox/app/modules/home/home_repository.dart';
import 'package:azerox/app/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_social_content_share/flutter_social_content_share.dart';
import 'dart:async';

import '../../models/post.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  final AppController _appController;
  HomeController(this.repository, this._appController);

  final searchDrawerEC = TextEditingController();

  ChangeNotifier changeNotifier = ChangeNotifier();

  //Variáveis para compor o menu
  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int newValue) => _selectedIndex(newValue);
  final items = [].obs;

  @override
  void onInit() {
    items.add(
      {
        'titulo': 'Home',
        'icone': const Icon(
          Icons.house_rounded,
          color: Colors.white,
        ),
        'rota': Routes.home,
      },
    );

    items.add(
      {
        'titulo': 'Novas Edições',
        'icone': Image.asset(
          AppImages.novasEdicoes,
        ),
        'rota': Routes.newEditions,
      },
    );
    items.add(
      {
        'titulo': 'Editores',
        'icone': Image.asset(AppImages.editores),
        'rota': Routes.publishers,
      },
    );

    items.add(
      {
        'titulo': 'Seguindo',
        'icone': Image.asset(AppImages.seguinte),
        'rota': Routes.following,
      },
    );

    items.add(
      {
        'titulo': 'Favoritos',
        'icone': Image.asset(
          AppImages.favorite,
          color: Colors.white,
        ),
        'rota': Routes.favoriteds,
      },
    );

    items.add(
      {
        'titulo': 'Net',
        'icone': Image.asset(AppImages.net1),
        'rota': '/',
      },
    );

    items.add(
      {
        'titulo': 'Configurações',
        'icone': const Icon(
          Icons.settings,
          color: Colors.white,
        ),
        'rota': '/',
      },
    );

    items.add(
      {
        'titulo': 'MMN',
        'icone': const Icon(
          Icons.person,
          color: Colors.white,
        ),
        'rota': '/',
      },
    );

    items.add(
      {
        'titulo': 'Sair',
        'icone': Image.asset(AppImages.sair),
        'rota': '/',
      },
    );

    super.onInit();
  }

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

  Future<void> updateImageProfile(String imagePath) async {
    final userProfile = await repository.uploadProfilePicture(imagePath);
    if (userProfile == null) return;
    _appController.currentUser = _appController.currentUser.copyWith(
      filePicture: userProfile.filePicture,
    );
  }
}
