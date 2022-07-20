import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/new_editor.dart';
import 'package:azerox/app/models/paged_info_new_editor.dart';
import 'package:azerox/app/modules/home/widgets/drawer/custom_drawer.dart';
import 'package:azerox/app/modules/publishers/controllers/chapters_Publisher_controller.dart';
import 'package:azerox/app/modules/publishers/controllers/editores_controller.dart';
import 'package:azerox/app/modules/publishers/widget/card_approved_editors_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class EditoresPage extends GetView<EditoresController> {
  const EditoresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChaptersPublisherController chaptersPublisherController =
    GetInstance().find();

    String? numberOfEditors;
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
                  Image.asset(
                    AppImages.editores,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Novas Solicitações de Editores',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.primary,
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                        child: FutureBuilder<PagedInfoNewEditor>(
                          future: controller.findNumberNewEditor(),
                          builder: (context, snapshot) {
                            // final List<PagedInfoNewEditor> newEditors =
                            //     snapshot.data ?? [];

                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CupertinoActivityIndicator());
                            }

                            return ListView.builder(
                              //  itemCount: newEditors.length,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    'Editores'+ '('+ snapshot.data!.totalRows.toString()+ ')',
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: PaginationWidget<NewEditor>(
                controller: chaptersPublisherController,
                builder: (context, newEditor) => CardApprovedEditorsWidget(
                  key: ValueKey(newEditor.codUserFriend),
                  newEditor: newEditor,
                  isShearch: true,
                  color: const Color(0XFF005E6C),
                  onAddCommentCallback:
                  chaptersPublisherController.onAddCommentCallback,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
