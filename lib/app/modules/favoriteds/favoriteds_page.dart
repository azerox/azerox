import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/modules/favoriteds/favoriteds_controller.dart';
import 'package:azerox/app/modules/home/home_controller.dart';
import 'package:azerox/app/modules/home/widgets/drawer/custom_drawer.dart';
import 'package:azerox/app/modules/home/widgets/post_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../config/app_images.dart';

class FavoritedsPage extends GetView<FavoritedsController> {
  const FavoritedsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: Image.asset(AppImages.logo),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 30,
              color: AppColors.primary,
              child: Row(
                children: const [
                  SizedBox(width: 10),
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text('Favoritos (2)'),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: homeController.getAlbum(true),
                builder: (context, snapshot) {
                  final List<Post> posts = snapshot.data ?? [];

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CupertinoActivityIndicator());
                  }

                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return PostWidget(post: posts[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
