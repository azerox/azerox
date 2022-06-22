import 'package:azerox/app/app_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_images.dart';
import '../../../config/app_routes.dart';
import '../../../models/post.dart';
import '../controllers/chapter_bottomsheet_controller.dart';
import '../home_controller.dart';

import 'post_button.dart';
import 'post_item_widget.dart';

typedef AddCommentCallback = void Function(Post comment);

class PostWidgetGeneric extends StatelessWidget {
  final Post post;
  final bool isComment;
  final bool isFavoritedsPage;
  final AddCommentCallback? onAddCommentCallback;
  final ChapterBottomsheetController? bottomsheetController;

  const PostWidgetGeneric({
    Key? key,
    required this.post,
    this.isComment = false,
    this.isFavoritedsPage = false,
    this.onAddCommentCallback,
    this.bottomsheetController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? currentIndex;
    final homeController = Get.find<HomeController>();
    final appController = Get.find<AppController>();

    bool isPostOwner =
        appController.currentUser.value.codUser == post.user?.codUser;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: isComment ? 0 : 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                height: 60,
                width: 58,
                fit: BoxFit.cover,
                imageUrl: post.user!.filePicture,
                placeholder: (context, url) {
                  return const CupertinoActivityIndicator();
                },
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            title: Text(
              post.user!.nick ?? post.user!.name.split(' ')[0],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(post.date ?? ''),
          ),
          Visibility(
            visible: post.nameEvent != null,
            child: Text(
              post.nameEvent ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Visibility(
            visible: post.dateEventString != null,
            child: Text(
              post.dateEventString ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: post.postItens?.length,
            itemBuilder: (context, int index) {
              currentIndex = index;
              final currentItem = post.postItens?[index];
              if (currentItem == null) return Container();
              return PostItemWidget(model: currentItem);
            },
          ),
          const SizedBox(height: 9),
          Visibility(
            visible: !isComment,
            child: TextButton(
              child: Text(
                '${post.listRepost?.length ?? 0} comentários',
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 15,
                ),
              ),
              onPressed: () {
                Get.toNamed(Routes.comments, arguments: post);
              },
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: !isComment,
            child: Row(
              children: [
                Expanded(
                  child: PostButtonWidget(
                    image: AppImages.balao,
                    onPressed: () async {
                      final newComment = await Get.toNamed(
                        Routes.createComment,
                        arguments: post,
                      );
                      if (newComment != null && newComment is Post) {
                        onAddCommentCallback?.call(newComment);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: PostButtonWidget(
                    isLikeBtn: true,
                    post: post,
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      await homeController.favoritePost(
                        post,
                        post.isFavorite ? false : true,
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
