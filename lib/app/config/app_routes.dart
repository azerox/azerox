import 'package:azerox/app/modules/new_editions/new_editions_page.dart';
import 'package:get/get.dart';

import '../modules/comments/comments_page.dart';
import '../modules/create_post/create_post_bindings.dart';
import '../modules/create_post/create_post_page.dart';
import '../modules/favoriteds/favoriteds_bindings.dart';
import '../modules/favoriteds/favoriteds_page.dart';
import '../modules/home/home_bindings.dart';
import '../modules/home/home_page.dart';
import '../modules/initial/initial_bindings.dart';
import '../modules/initial/initial_page.dart';
import '../modules/login/login_bindings.dart';
import '../modules/login/login_page.dart';
import '../modules/new_editions/new_editions_bindings.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const InitialPage(),
      binding: InitialBindings(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: Routes.comments,
      page: () => const CommentsPage(),
    ),
    GetPage(
      name: Routes.favoriteds,
      page: () => const FavoritedsPage(),
      binding: FavoritedsBindings(),
    ),
    GetPage(
      name: Routes.newEditions,
      page: () => const NewEditionsPage(),
      binding: NewEditionsBindings(),
    ),
    GetPage(
      name: Routes.createPost,
      page: () => CreatePostPage(),
      binding: CreatePostBindings(),
    ),
  ];
}

class Routes {
  static const initial = '/initial';
  static const login = '/login';
  static const home = '/home';
  static const comments = '/comments';
  static const favoriteds = '/favoriteds';
  static const newEditions = '/newEditions';
  static const createPost = '/createPost';
}
