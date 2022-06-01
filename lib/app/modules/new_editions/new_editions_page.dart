import 'package:azerox/app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_colors.dart';
import '../../config/app_images.dart';
import '../../models/post.dart';
import '../home/widgets/drawer/custom_drawer.dart';
import '../home/widgets/post_widget.dart';
import 'new_editions_controller.dart';

class NewEditionsPage extends StatelessWidget {
  const NewEditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewEditionsController>();

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
                children: [
                  const SizedBox(width: 10),
                  Image.asset(AppImages.novasEdicoes),
                  const SizedBox(width: 10),
                  const Text(
                    'Novas edições',
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
