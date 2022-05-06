
import 'package:azerox/app/modules/new_editions/new_editions_page.dart';
import 'package:azerox/app/modules/register/politics/consentient_terms.dart';
import 'package:azerox/app/modules/register/politics/politics.dart';
import 'package:azerox/app/modules/register/politics/use_terms.dart';
import 'package:azerox/app/modules/register/register_bindings.dart';
import 'package:azerox/app/modules/register/register_email_page.dart';
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
    GetPage(
      name: Routes.cadastro_email,
      page: () => CadastroEmailPage(),
      binding: CadastroEmailBindings(),
    ),
    GetPage(
      name: Routes.consentientTerms,
      page: () => const ConsentientTerms(),
    ),
    GetPage(
      name: Routes.politics,
      page: () => const Politics(),
    ),
    GetPage(
      name: Routes.useTerms,
      page: () => const UseTerms(),
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
  static const cadastro_email = '/cadastro_email';
  static const politics = '/politics';
  static const useTerms = '/useTerms';
  static const consentientTerms = '/consentientTerms';
}
