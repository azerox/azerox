import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/modules/home/widgets/drawer/custom_drawer.dart';
import 'package:azerox/app/modules/home/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_images.dart';
import 'favoriteds_controller.dart';

class FavoritedsPage extends StatelessWidget {
  const FavoritedsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavoritedsController>();
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
                  Icon(Icons.favorite, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Favoritos',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PaginationWidget<Post>(
                controller: controller,
                builder: (context, post) => PostWidget(
                  key: ValueKey(post.codPost),
                  post: post,
                  onAddCommentCallback: controller.onAddCommentCallback,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
