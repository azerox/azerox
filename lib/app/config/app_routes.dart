import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/modules/comments/comments_bindings.dart';
import 'package:azerox/app/modules/comments/pages/create_comment_page.dart';
import 'package:azerox/app/modules/configuration/visited_house_bindings.dart';
import 'package:azerox/app/modules/configuration/visited_house_page.dart';


import 'package:azerox/app/modules/mmn/mmn_bindings.dart';
import 'package:azerox/app/modules/mmn/mmn_page.dart';
import 'package:azerox/app/modules/net/net_bindings.dart';
import 'package:azerox/app/modules/net/net_page.dart';
import 'package:azerox/app/modules/new_editions/new_editions_page.dart';
import 'package:azerox/app/modules/publishers/editores_bindings.dart';
import 'package:azerox/app/modules/publishers/editores_page.dart';
import 'package:azerox/app/modules/register/politics/consentient_terms.dart';
import 'package:azerox/app/modules/register/politics/politics.dart';
import 'package:azerox/app/modules/register/politics/use_terms.dart';
import 'package:azerox/app/modules/register/register_bindings.dart';
import 'package:azerox/app/modules/register/register_email_page.dart';
import 'package:azerox/app/modules/specific_comments/pages/create_comment_page.dart';
import 'package:azerox/app/modules/specific_comments/pages/specific_comments_page.dart';
import 'package:azerox/app/modules/specific_comments/specific_comments_bindings.dart';
import 'package:get/get.dart';

import '../modules/comments/pages/comments_page.dart';
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
  late final Post post;
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
      page: () => CommentsPage.fromRouteArguments(Get.arguments),
      binding: CommentsBindings(),
    ),
    GetPage(
      name: Routes.createComment,
      page: () => CreateCommentPage.fromRouteArguments(Get.arguments),
      binding: CommentsBindings(),
    ),
    GetPage(
      name: Routes.specificComments,
      page: () => SpecificCommentsPage.fromRouteArguments(Get.arguments),
      binding: SpecificCommentsBindings(),
    ),
    GetPage(
      name: Routes.specificCreateComment,
      page: () => SpecificCreateCommentPage.fromRouteArguments(Get.arguments),
      binding: SpecificCommentsBindings(),
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
      name: Routes.cadastroEmail,
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
    GetPage(
      name: Routes.visitedHouse,
      page: () => VisitedHousePage(),
      binding: VisitedHouseBindings(),
    ),
    GetPage(
      name: Routes.publishers,
      page: () => EditoresPage(),
      binding: EditoresBindings(),
    ),
    GetPage(
      name: Routes.net,
      page: () => NetPage(),
      binding: NetBindings(),
    ),
    GetPage(
      name: Routes.mmn,
      page: () => MMNPage(),
      binding: MMNBindings(),
    ),
  ];
}

class Routes {
  static const initial = '/initial';
  static const login = '/login';
  static const home = '/home';
  static const comments = '/comments';
  static const specificComments = '/specific_comments';
  static const favoriteds = '/favoriteds';
  static const net = '/net';
  static const newEditions = '/newEditions';
  static const publishers = '/publishers';
  static const createPost = '/createPost';
  static const cadastroEmail = '/cadastro_email';
  static const politics = '/politics';
  static const useTerms = '/useTerms';
  static const consentientTerms = '/consentientTerms';
  static const visitedHouse = '/visited_house';
  static const mmn = '/mmn';
  static const createComment = '/infiniteComments';
  static const specificCreateComment = '/specific_createComment';
}
