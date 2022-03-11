import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_colors.dart';
import '../../config/app_images.dart';
import '../../models/post.dart';
import '../home/widgets/drawer/custom_drawer.dart';
import '../home/widgets/post_widget.dart';
import 'new_editions_controller.dart';

class NewEditionsPage extends GetView<NewEditionsController> {
  const NewEditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  const Text('Novas edições (2)'),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: controller.getNewEditions(),
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
