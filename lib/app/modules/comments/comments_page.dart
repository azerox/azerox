import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/modules/home/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'comments_controller.dart';

class CommentsPage extends GetView<CommentsController> {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final comments = Get.arguments['listRepost'] as List<Post>;
    final postInitial = Get.arguments['post'] as Post;

    final divider = Container(
      color: AppColors.primary,
      width: 10,
      height: 16,
    );

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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              PostWidget(post: postInitial),
              divider,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final post = comments[index];

                  return Column(
                    children: [
                      PostWidget(
                        post: post,
                        isComment: true,
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
