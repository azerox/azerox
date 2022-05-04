import 'package:azerox/app/models/pagination_filter.dart';
import 'package:azerox/app/models/post.dart';
import 'package:get/get.dart';

import 'new_editions_repository.dart';

class NewEditionsController extends GetxController {
  final NewEditionsRepository repository;
  NewEditionsController(this.repository);


  final _posts = <Post>[].obs;
  final _paginationFilterNewEditions = PaginationFilter().obs;
  int? get pagesize => _paginationFilterNewEditions.value.pagesize;
  int? get _page => _paginationFilterNewEditions.value.page;
  final _lastPageNewEditions = false.obs;
  bool get lastPageNewEditions => _lastPageNewEditions.value;

  List<Post> get posts => _posts.toList();

  @override
  void onInit(){
    ever(_paginationFilterNewEditions, (_) => getNewEditions());
    _changePaginationFilterNewEditions(1, 10);

    super.onInit();
  }

  void _changePaginationFilterNewEditions(int page, int pagesize){
    _paginationFilterNewEditions.update((val) {
      val?.page = page;
      val?.pagesize = pagesize;
    });
  }

  void changeTotalPerPage(int limitValue){
    _posts.clear();
    _lastPageNewEditions.value = false;
    _changePaginationFilterNewEditions(1, limitValue);
  }

  void netxPage() => _changePaginationFilterNewEditions(_page! + 1, pagesize!);


  Future<List<Post>> getNewEditions() async {
    final response = await repository.getNewEditions(_paginationFilterNewEditions.value);


    if(response.isEmpty){
      _lastPageNewEditions. value = true;
    }
    _posts.addAll(response);

    return response;
  }
}
