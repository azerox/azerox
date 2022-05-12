import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_images.dart';
import '../../../config/app_routes.dart';
import '../../../models/post.dart';
import '../home_controller.dart';
import 'card_options.dart';
import 'post_button.dart';
import 'post_item_widget.dart';

class PostWidget extends StatefulWidget {
  final Post post;
  final bool isComment;
  final bool isFavoritedsPage;

  const PostWidget({
    Key? key,
    required this.post,
    this.isComment = false,
    this.isFavoritedsPage = false,
  }) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    int? currentIndex;
    final homeController = Get.find<HomeController>();

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: widget.isComment ? 0 : 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 9,
      ),
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
                imageUrl: widget.post.user!.filePicture,
                placeholder: (context, url) {
                  return const CupertinoActivityIndicator();
                },
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            title: Text(
              widget.post.user!.nick ?? widget.post.user!.name.split(' ')[0],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(widget.post.date ?? ''),
            trailing: IconButton(
              iconSize: 29,
              icon: Image.asset(AppImages.optionsMore),
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return CardOptions(
                      isComment: widget.isComment,
                      post: widget.post,
                    );
                  },
                );
              },
            ),
          ),
          Visibility(
            visible: widget.post.nameEvent != null,
            child: Text(
              widget.post.nameEvent ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Visibility(
            visible: widget.post.dateEventString != null,
            child: Text(
              widget.post.dateEventString ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.post.postItens?.length,
            itemBuilder: (context, int index) {
              currentIndex = index;
              final currentItem = widget.post.postItens?[index];
              if (currentItem == null) return Container();
              return PostItemWidget(
                model: currentItem,
                downloadFileCallback: (networkAudioUrl) async {
                  return await homeController.repository
                      .downloadAudioFile(networkAudioUrl);
                },
              );
            },
          ),
          const SizedBox(height: 9),
          Visibility(
            visible: !widget.isComment,
            child: TextButton(
              child: Text(
                '${widget.post.listRepost?.length ?? 0} comentários',
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 15,
                ),
              ),
              onPressed: () {
                Get.toNamed(Routes.comments, arguments: {
                  'post': widget.post,
                  'listRepost': widget.post.listRepost ?? [],
                });
              },
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: !widget.isComment,
            child: Row(
              children: [
                Expanded(
                  child: PostButtonWidget(
                    image: AppImages.balao,
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: PostButtonWidget(
                    image: AppImages.fb,
                    onPressed: () async {
                      if (widget.post.postItens?[currentIndex!].codPostType ==
                          3) {
                        await homeController.sendToFacebook(
                            widget.post.postItens?[currentIndex!].postItemMax ??
                                '');
                      }
                    },
                  ),
                ),
                Expanded(
                  child: PostButtonWidget(
                    isLikeBtn: true,
                    post: widget.post,
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      await homeController.favoritePost(
                        widget.post,
                        widget.post.isFavorite ? false : true,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: PostButtonWidget(
                    image: AppImages.insta,
                    onPressed: () async {
                      if (widget.post.postItens?[currentIndex!].codPostType ==
                          3) {
                        await homeController.sendToInstagram(
                            widget.post.postItens?[currentIndex!].postItemMax ??
                                '');
                      }
                    },
                  ),
                ),
                Expanded(
                  child: PostButtonWidget(
                    image: AppImages.tiktok,
                    onPressed: () async {},
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
