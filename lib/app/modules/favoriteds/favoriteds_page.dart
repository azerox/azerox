import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/modules/home/widgets/drawer/custom_drawer.dart';
import 'package:azerox/app/modules/home/widgets/post_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../config/app_images.dart';
import 'favoriteds_controller.dart';

class FavoritedsPage extends StatefulWidget {
  const FavoritedsPage({Key? key}) : super(key: key);

  @override
  State<FavoritedsPage> createState() => _FavoritedsPageState();
}

class _FavoritedsPageState extends State<FavoritedsPage> {
  final controller = Get.find<FavoritedsController>();
  
  @override
  void initState() {
    super.initState();
    controller.refreshChapters();
  }

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
                children: const [
                  SizedBox(width: 10),
                  Icon(Icons.favorite, color: Colors.white),
                  SizedBox(width: 10),
                  Text('Favoritos (2)'),
                ],
              ),
            ),
            Expanded(
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  final List<Post>? posts = controller.value.chaptersList;
                  if (posts == null) {
                    return const Center(child: CupertinoActivityIndicator());
                  }

                  return LazyLoadScrollView(
                    onEndOfPage: () => controller.loadMoreChapters(),
                    isLoading: controller.value.isLoading,
                    scrollOffset: 200,
                    child: RefreshIndicator(
                      onRefresh: () => controller.refreshChapters(),
                      child: ListView.builder(
                        padding: const EdgeInsets.all(10),
                        physics: const BouncingScrollPhysics(),
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final isLastest = index == posts.length - 1;
                          final isLoading = controller.value.isLoading;
                          if (isLastest && isLoading) {
                            return Column(
                              children: [
                                PostWidget(post: posts[index]),
                                Container(
                                  alignment: Alignment.topCenter,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                  child: const CupertinoActivityIndicator(),
                                ),
                              ],
                            );
                          }
                          return PostWidget(post: posts[index]);
                        },
                      ),
                    ),
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
