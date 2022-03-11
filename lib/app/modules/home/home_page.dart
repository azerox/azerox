import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/config/app_routes.dart';
import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/modules/home/widgets/post_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_images.dart';
import 'home_controller.dart';
import 'widgets/drawer/custom_drawer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var showShearch = false.obs;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: Image.asset(AppImages.logo),
        centerTitle: true,
        actions: [
          Obx(() {
            return IconButton(
              icon: Icon(
                Icons.search,
                color: showShearch.value ? Colors.blue : Colors.white,
                size: 29,
              ),
              onPressed: () {
                showShearch.value = !showShearch.value;
              },
            );
          })
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Obx(() {
              return Visibility(
                visible: showShearch.value,
                child: Container(
                  height: 50,
                  color: AppColors.primary,
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.nomeData,
                        height: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: SizedBox(
                            height: 17,
                            child: TextFormField(
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Capítulos',
                                hintStyle: const TextStyle(fontSize: 10),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  size: 15,
                                ),
                                suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.close,
                                    size: 6,
                                  ),
                                  onPressed: () {},
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: controller.getAlbum(),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 90,
        width: 90,
        margin: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          child: Image.asset(AppImages.homeBtn),
          onPressed: () {
            Get.toNamed(Routes.createPost);
          },
        ),
      ),
    );
  }
}
