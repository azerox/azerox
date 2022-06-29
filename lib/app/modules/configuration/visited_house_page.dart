import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/editor_model.dart';
import 'package:azerox/app/modules/configuration/widget/social_network_widget.dart';
import 'package:azerox/app/modules/home/widgets/card_info_widget.dart';
import 'package:azerox/app/modules/home/widgets/post_widget_generic.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/app_colors.dart';
import '../../config/app_images.dart';
import '../../models/post.dart';
import '../home/widgets/drawer/custom_drawer.dart';
import 'visited_house_controller.dart';

class VisitedHousePage extends StatelessWidget {
  const VisitedHousePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final Post post;

    final controller = Get.find<VisitedHouseController>();



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

            Row(
              children: [

                  FutureBuilder<List<EditorModel>>(
                    future: controller.searchByUser(),
                    builder: (context, snapshot) {
                      final List<EditorModel> editores = snapshot.data ?? [];

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CupertinoActivityIndicator());
                       }

                      print(editores);
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: editores.length,
                        itemBuilder: (context, index) {
                          return SocialNetworkWidget(editor: editores[index]);
                        },
                      );
                    },
                  ),

              ],
            ),

            // Expanded(
            //   child: PaginationWidget<Post>(
            //     controller: controller,
            //     builder: (context, post) => PostWidgetGeneric(
            //       key: ValueKey(post.codPost),
            //       post: post,
            //       onAddCommentCallback: controller.onAddCommentCallback,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
