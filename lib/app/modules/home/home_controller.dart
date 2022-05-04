import 'package:azerox/app/models/editor_model.dart';
import 'package:azerox/app/models/pagination_filter.dart';
import 'package:azerox/app/modules/home/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_social_content_share/flutter_social_content_share.dart';

import '../../models/post.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController(this.repository);

  final searchDrawerEC = TextEditingController();

  final _posts = <Post>[].obs;
  var response = null;
  final _paginationFilterAlbum = PaginationFilter().obs;
  int? get pagesize => _paginationFilterAlbum.value.pagesize;
  int? get _page => _paginationFilterAlbum.value.page;
  final _lastPageAlgum = false.obs;
  bool get lastPageAlgum => _lastPageAlgum.value;



  List<Post> get posts => _posts.toList();

  @override
  void onClose() {
    searchDrawerEC.dispose();
    super.onClose();
  }

  @override
  void onInit(){
    ever(_paginationFilterAlbum, (_) => getAlbum());
    _changePaginationFilterAlgum(1, 10);
    super.onInit();
  }


  void _changePaginationFilterAlgum(int page, int pagesize){
    _paginationFilterAlbum.update((val) {
      val?.page = page;
      val?.pagesize = pagesize;
    });
  }

  void changeTotalPerPage(int limitValue){
    _posts.clear();
    _lastPageAlgum.value = false;
    _changePaginationFilterAlgum(1, limitValue);
  }

  void nextPage() => _changePaginationFilterAlgum(_page! + 1, pagesize!);

  Future<List<Post>> getAlbum([bool isFavoritedPage = false]) async {
    response =
        await repository.getAlbum(_paginationFilterAlbum.value,isFavoritedPage: isFavoritedPage);

    if(response.isEmpty){
      _lastPageAlgum. value = true;
    }
    _posts.addAll(response);

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
