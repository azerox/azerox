import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/modules/home/controllers/chapter_bottomsheet_controller.dart';
import 'package:azerox/app/modules/home/home_repository.dart';
import 'package:azerox/app/modules/home/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/comments_controller.dart';

class CommentsPage extends StatefulWidget {
  final Post chapter;
  final List<Post> comments;
  const CommentsPage({required this.chapter, required this.comments, Key? key})
      : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  late final CommentsController controller;
  late final ChapterBottomsheetController bottomSheetController;

  @override
  void initState() {
    super.initState();
    controller = Get.find<CommentsController>();
    controller.setCommentsList(widget.comments);
    controller.setChapterId(widget.chapter.codPost!);
    bottomSheetController = ChapterBottomsheetController(
      Get.find<CommentsController>(),
      Get.find<HomeRepository>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        automaticallyImplyLeading: false,
        title: const Text('Comentários'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: const [
                Icon(Icons.arrow_back_ios),
                Text('Voltar'),
              ],
            ),
          ),
        ),
      ),
      body: PaginationWidget<Post>(
        controller: controller,
        autoRefresh: false,
        header: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PostWidget(
              post: widget.chapter,
              onAddCommentCallback: controller.addNewComment,
            ),
            Container(color: AppColors.primary, width: 10, height: 16),
          ],
        ),
        builder: (context, comment) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: PostWidget(
              post: comment,
              isComment: true,
              bottomsheetController: bottomSheetController,
            ),
          );
        },
      ),
    );
  }
}
