import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/modules/home/controllers/chapters_controller.dart';
import 'package:azerox/app/modules/home/home_repository.dart';

class FavoritedsController extends ChaptersController {
  FavoritedsController(HomeRepository repository) : super(repository);

  @override
  Future<List<Post>> getCurrentPageChapters() async {
    final posts = await repository.getAlbum(
      isFavoritedPage: true,
      page: value.page,
    );
    value = value.copyWith(page: value.page + 1);
    return posts;
  }
}
