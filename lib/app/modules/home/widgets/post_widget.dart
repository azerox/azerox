import 'package:audioplayers/audioplayers.dart';
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
  final AudioPlayer audioPlayer = AudioPlayer();
  late PlayerState playerState = PlayerState.PAUSED;
  Duration duration = const Duration();
  Duration position = const Duration();

  @override
  void initState() {
    audioPlayer.onPlayerStateChanged.listen((state) {
      playerState = state;
      if (state == PlayerState.COMPLETED) {
        audioPlayer.seek(const Duration(seconds: 0));
        audioPlayer.pause();
      }
      setState(() {});
    });

    audioPlayer.onDurationChanged.listen((dur) {
      setState(() {
        duration = dur;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((pos) {
      setState(() {
        position = pos;
      });
    });
    super.initState();
  }

  playAudio(String urlAudio) async {
    audioPlayer.release();
    await audioPlayer.play(urlAudio);
  }

  pauseAudio() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    String? imgPost;
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
              if (widget.post.postItens?[index].codPostType == 1) {
                // TEXTO
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      widget.post.postItens?[0].postItem ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              } else if (widget.post.postItens?[index].codPostType == 3) {
                //IMAGEM
                imgPost = widget.post.postItens?[index].postItemMax ?? '';
                return CachedNetworkImage(
                  width: 318,
                  fit: BoxFit.cover,
                  imageUrl: imgPost ?? '',
                  placeholder: (context, url) {
                    return const CupertinoActivityIndicator();
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                );
              } else if (widget.post.postItens?[index].codPostType == 2) {
                //AUDIO
                return Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            playerState == PlayerState.PAUSED
                                ? Icons.play_arrow
                                : Icons.pause,
                            color: AppColors.green,
                          ),
                          onPressed: () {
                            if (playerState == PlayerState.PLAYING) {
                              pauseAudio();
                            }
                            if (playerState == PlayerState.PAUSED) {
                              playAudio(widget.post.postItens?[index].postItem
                                  as String);
                            }
                            setState(() {});
                          },
                        ),
                        Expanded(
                          child: Slider.adaptive(
                            activeColor: AppColors.green,
                            thumbColor: AppColors.green,
                            min: 0.0,
                            max: duration.inSeconds.toDouble(),
                            value: position.inSeconds.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                audioPlayer
                                    .seek(Duration(seconds: value.toInt()));
                              });
                            },
                          ),
                        ),
                        Text(
                          '${position.inMinutes}:${position.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              } else {
                return Container();
              }
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
                        await homeController.sendToFacebook(imgPost!);
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
                        await homeController.sendToInstagram(imgPost!);
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
