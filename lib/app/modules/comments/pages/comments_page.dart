import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/modules/home/controllers/chapter_bottomsheet_controller.dart';
import 'package:azerox/app/modules/home/repositories/chapter_bottomsheet_repository.dart';
import 'package:azerox/app/modules/home/widgets/post_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/comments_controller.dart';

class CommentsPage extends StatefulWidget {
  final Post? chapter;
  final int? chapterId;

  factory CommentsPage.fromRouteArguments(dynamic arguments, {Key? key}) {
    if (arguments is int) return CommentsPage.byChapterId(arguments, key: key);
    if (arguments is Post) return CommentsPage.byChapter(arguments, key: key);
    throw Exception('Invalid route arguments');
  }

  const CommentsPage.byChapter(Post chapter, {Key? key})
      : chapter = chapter,
        chapterId = null,
        super(key: key);

  CommentsPage.byChapterId(int chapterId, {Key? key})
      : chapter = null,
        chapterId = chapterId,
        super(key: key);

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

    bottomSheetController = ChapterBottomsheetController(
      controller.removeCommentById,
      Get.find<ChapterBottomsheetRepository>(),
    );

    if (widget.chapterId != null) {
      controller.refresh(widget.chapterId);
      return;
    }

    if (widget.chapter != null) {
      controller.setChapter(widget.chapter!);
      if (widget.chapter!.listRepost != null) controller.setCommentsList(widget.chapter!.listRepost!);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        controller.refresh();
      });
    }
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
          behavior: HitTestBehavior.opaque,
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
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          final List<Post>? itemsList = controller.value.commentsList;
          final header = Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (controller.value.chapter != null) ...{
                PostWidget(
                  post: controller.value.chapter!,
                  onAddCommentCallback: controller.addNewComment,
                ),
                Container(color: AppColors.primary, width: 10, height: 16),
              },
            ],
          );
          if (itemsList == null) {
            return ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              children: [
                header,
                const Expanded(child: Center(child: CupertinoActivityIndicator())),
              ],
            );
          }
          int itemsLength = itemsList.length + 1;
          return RefreshIndicator(
            onRefresh: controller.refresh,
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              physics: const BouncingScrollPhysics(),
              itemCount: itemsLength,
              itemBuilder: (context, index) {
                if (index == 0) return header;

                int currentIndex = index - 1;
                final isLastest = currentIndex == itemsList.length - 1;
                final isLoading = controller.value.isLoading;

                final item = Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: PostWidget(
                    key: Key(itemsList[currentIndex].codPost.toString()),
                    bottomsheetController: bottomSheetController,
                    post: itemsList[currentIndex],
                    isComment: true,
                  ),
                );
                if (isLastest && isLoading) {
                  return Column(
                    children: [
                      item,
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: const CupertinoActivityIndicator(),
                      ),
                    ],
                  );
                }
                return item;
              },
            ),
          );
        },
      ),

      // PaginationWidget<Post>(
      //   controller: controller,
      //   autoRefresh: false,
      //   header: ,
      //   builder: (context, comment) {
      //     return Padding(
      //       padding: const EdgeInsets.only(bottom: 16),
      //       child: PostWidget(
      //         post: comment,
      //         isComment: true,
      //         bottomsheetController: bottomSheetController,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
