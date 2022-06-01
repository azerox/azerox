import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/config/app_routes.dart';
import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/modules/home/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_images.dart';
import 'controllers/chapters_controller.dart';
import 'widgets/drawer/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChaptersController controller = GetInstance().find();
  var showShearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: Image.asset(AppImages.logo),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: showShearch ? Colors.blue : Colors.white,
              size: 29,
            ),
            onPressed: () {
              setState(() => showShearch = !showShearch);
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Visibility(
            visible: showShearch,
            child: Container(
              height: 50,
              color: AppColors.primary,
              child: Row(
                children: [
                  Image.asset(AppImages.nomeData, height: 20),
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
                            prefixIcon: const Icon(Icons.search, size: 15),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.close, size: 6),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
