import 'dart:async';

import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/config/app_routes.dart';
import 'package:azerox/app/models/editor_model.dart';
import 'package:azerox/app/models/new_editor.dart';
import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/models/user.dart';
import 'package:azerox/app/modules/home/repositories/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_content_share/flutter_social_content_share.dart';
import 'package:get/get.dart';

import '../../models/assinante_model.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  final AppController _appController;

  HomeController(this.repository, this._appController);

  final searchDrawerEC = TextEditingController();

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
        'icone': AppImages.home,
        'rota': Routes.home,
      },
    );

    items.add(
      {
        'titulo': 'Novas Edições',
        'icone': AppImages.novasEdicoes,
        'rota': Routes.newEditions,
      },
    );
    items.add(
      {
        'titulo': 'Editores',
        'icone': AppImages.editores,
        'rota': Routes.publishers,
      },
    );
    items.add(
      {
        'titulo': 'Favoritos',
        'icone': AppImages.favorite,
        'rota': Routes.favoriteds,
      },
    );

    items.add(
      {
        'titulo': 'Net',
        'icone': AppImages.net1,
        'rota': Routes.net,
      },
    );

    items.add(
      {
        'titulo': 'Home Visitantes',
        'icone': AppImages.configuration,
        'rota': Routes.visitedHouse,
      },
    );

    items.add(
      {
        'titulo': 'MMN',
        'icone': AppImages.mmn,
        'rota': Routes.mmn,
      },
    );

    items.add(
      {
        'titulo': 'Sair',
        'icone': AppImages.sair,
        'rota': '/',
      },
    );

    super.onInit();
  }

  @override
  set value(TextEditingValue newValue) {
    assert(
      !newValue.composing.isValid || newValue.isComposingRangeValid,
      'New TextEditingValue $newValue has an invalid non-empty composing range '
      '${newValue.composing}. It is recommended to use a valid composing range, '
      'even for readonly text fields',
    );
  }

  void clear() {
    value =
        const TextEditingValue(selection: TextSelection.collapsed(offset: 0));
  }

  @override
  void onClose() {
    items.close();
    searchDrawerEC.dispose();
    super.onClose();
  }

  Future<List<Post>> getAlbum() async {
    final posts = await repository.getAlbum(page: 1);
    return posts;
  }

  Future<void> favoritePost(Post post, [bool isLike = true]) async {
    await repository.favoritePost(post, isLike);
  }

  Future<AssinanteModel?> statusAssinante(int? codUser) async {
    return await repository.localizaAssinante(codUser: codUser!);
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

  
  Future<void> updateImageProfile(String imagePath) async {
    final userProfile = await repository.uploadProfilePicture(imagePath);
    if (userProfile == null) return;
    _appController.currentUser.value =
        _appController.currentUser.value.copyWith(
      filePicture: userProfile.filePicture,
    );
  }

  Future<List<NewEditor>> getlistNewEditor() async {
    return await repository.getListNewEditorPeding();
  }
}
