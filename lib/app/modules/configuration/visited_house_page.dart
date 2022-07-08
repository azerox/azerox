import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/modules/configuration/widget/visited_house_drawer_content_widget.dart';
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
  final int? editores;
  final bool? showEditores;

  const VisitedHousePage({
    Key? key,
    this.editores = 1,
    this.showEditores = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    'Home Visitantes',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: controller.searchDrawerEC.text.length < 3,
              child: VisitedHouseDrawerContentWidget(
                editores: editores,
                showEditores: showEditores,
              ),
            ),
            Expanded(
              child: PaginationWidget<Post>(
                controller: controller,
                builder: (context, post) => PostWidgetGeneric(
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
