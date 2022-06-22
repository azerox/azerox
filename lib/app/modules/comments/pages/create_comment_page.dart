import 'dart:io';
import 'package:azerox/app/modules/comments/widgets/aviso_modal_comment.dart';
import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/post.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/create_comment_controller.dart';
import '../widgets/image_source_widget.dart';
import '../widgets/recording_widget.dart';

class CreateCommentPage extends StatefulWidget {
  final Post chapter;
  const CreateCommentPage.fromRouteArguments(dynamic arguments, {Key? key})
      : chapter = arguments,
        super(key: key);

  @override
  State<CreateCommentPage> createState() => _CreateCommentPageState();
}

class _CreateCommentPageState extends State<CreateCommentPage> {
  final CreateCommentController controller = GetInstance().find();

  @override
  void initState() {
    super.initState();
    controller.setChapter(widget.chapter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text(
                'Fechar',
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
            ),
            const Text(
              'Comentar',
              style: TextStyle(color: Colors.white, fontSize: 21),
            ),
            TextButton(
              onPressed: controller.onCreateCommentPressed,
              child: const Text(
                'Ok',
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          height: 70,
                          width: 68,
                          fit: BoxFit.cover,
                          imageUrl: Get.find<AppController>()
                              .currentUser
                              .value
                              .filePicture,
                          placeholder: (context, url) {
                            return const CupertinoActivityIndicator();
                          },
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0XFFC01E23),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            width: 40,
                            height: 30,
                            child: const Center(
                              child: Text(
                                '10',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 3),
                          GestureDetector(
                            child: Image.asset(AppImages.interrogacao),
                            onTap: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(32),
                                      topRight: Radius.circular(32),
                                    ),
                                  ),
                                  context: context,
                                  builder: (context) => const AvisoModalComment());
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      children: [
                        TextField(
                          style: const TextStyle(color: Colors.black),
                          onChanged: controller.onCommentContentChanged,
                          maxLength: 500,
                          maxLines: 6,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Texto',
                            hintStyle: const TextStyle(
                              color: AppColors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            counter: AnimatedBuilder(
                              animation: controller,
                              builder: (context, child) => Text(
                                '${controller.contentComment?.length ?? 0}/500',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Visibility(
                    visible: controller.imagePath != null,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Image.file(
                            File(controller.imagePath ?? ""),
                            fit: BoxFit.cover,
                            height: 170,
                            width: double.infinity,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: FloatingActionButton(
                            onPressed: controller.removeImage,
                            heroTag: 'close-floating-action-button',
                            child: const Icon(Icons.close),
                            mini: true,
                            backgroundColor: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  if (controller.recordedMp3FilePath == null) {
                    return Container();
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: AudioPlayerWidget(controller.audioController),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: controller.onRemoveMp3File,
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          if (!controller.isRecordVisible) {
            return Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 70,
                    child: ElevatedButton(
                      child: Image.asset(AppImages.camera),
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
                          builder: (context) =>
                              const ImageSourceWidget(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        primary: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: SizedBox(
                    height: 70,
                    child: ElevatedButton(
                      child: Image.asset(AppImages.microfone),
                      onPressed: controller.onOpenRecordDialogPressed,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        primary: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const RecordingWidget();
        },
      ),
    );
  }
}
