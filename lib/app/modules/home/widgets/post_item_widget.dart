import 'package:audioplayers/audioplayers.dart';
import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/models/post_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../audio_controller.dart';

class PostItemWidget extends StatefulWidget {
  final PostItens model;
  const PostItemWidget({Key? key, required this.model}) : super(key: key);

  @override
  State<PostItemWidget> createState() => _PostItemWidgetState();
}

class _PostItemWidgetState extends State<PostItemWidget> {
  final audioController = AudioController();

  @override
  void initState() {
    super.initState();
    if (widget.model.codPostType == 2) {
      audioController.init(widget.model.postItem!);
    }
  }

  @override
  void dispose() {
    audioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: audioController,
      builder: (context, child) {
        if (widget.model.codPostType == 1) {
          // TEXTO
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                widget.model.postItem ?? '',
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
              const SizedBox(height: 10),
            ],
          );
        } else if (widget.model.codPostType == 3) {
          //IMAGEM
          final imgPost = widget.model.postItemMax ?? '';
          return CachedNetworkImage(
            width: 318,
            fit: BoxFit.cover,
            imageUrl: imgPost,
            placeholder: (context, url) {
              return const CupertinoActivityIndicator();
            },
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
        } else if (widget.model.codPostType == 2) {
          //AUDIO
          return Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      audioController.state == PlayerState.PAUSED
                          ? Icons.play_arrow
                          : Icons.pause,
                      color: AppColors.green,
                    ),
                    onPressed: () {
                      if (audioController.state == PlayerState.PLAYING) {
                        audioController.pause();
                      }
                      if (audioController.state == PlayerState.PAUSED) {
                        audioController.play();
                      }
                    },
                  ),
                  Expanded(
                    child: Slider.adaptive(
                      activeColor: AppColors.green,
                      thumbColor: AppColors.green,
                      min: 0.0,
                      max: audioController.duration.inMilliseconds.toDouble(),
                      value: audioController.position.inMilliseconds.toDouble(),
                      onChanged: (value) {
                        audioController.seek(Duration(milliseconds: value.toInt()));
                      },
                      onChangeStart: (value) {
                        audioController.pause();
                      },
                      onChangeEnd: (value) {
                        audioController.play();
                      },
                    ),
                  ),
                  Text(audioController.remainingTimeString),
                ],
              ),
              const SizedBox(height: 10),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
