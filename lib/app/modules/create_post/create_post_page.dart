import 'dart:io';

import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/config/app_routes.dart';
import 'package:azerox/app/modules/create_post/widgets/timer_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import './create_post_controller.dart';
import '../../app_controller.dart';

class CreatePostPage extends GetView<CreatePostController> {
  CreatePostPage({Key? key}) : super(key: key);

  final record = ValueNotifier(false);
  final timerController = TimerController(0);

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
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
              ),
            ),
            const Text(
              'Capítulo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
              ),
            ),
            TextButton(
              child: const Text(
                'Ok',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
              ),
              onPressed: () async {
                if (controller.contentChapter != null) {
                  await controller.createPost(
                    controller.mp3,
                    controller.image?.value,
                  );

                  Get.offAllNamed(Routes.home);
                }
              },
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
                          imageUrl:
                              Get.find<AppController>().currentUser.filePicture,
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
                          Image.asset(AppImages.interrogacao),
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
                          maxLength: 50,
                          decoration: const InputDecoration(
                            counterText: "",
                            hintText: 'Título do capítulo: 50 carácteres...',
                            hintStyle: TextStyle(
                              color: AppColors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            controller.titleChapter = value;
                          },
                        ),
                        GestureDetector(
                          onTap: () async {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (builder) {
                                return SizedBox(
                                  height: 255,
                                  child: CupertinoDatePicker(
                                    backgroundColor: Colors.white,
                                    mode: CupertinoDatePickerMode.date,
                                    onDateTimeChanged: (value) {
                                      controller.dateFormated.value =
                                          DateFormat('dd/MM/yyyy')
                                              .format(value);
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            children: [
                              const Text(
                                'Data:',
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.grey[350],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(child: Obx(() {
                                  return Text(
                                    controller.dateFormated.value,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                })),
                              ),
                            ],
                          ),
                        ),
                        TextField(
                          style: const TextStyle(color: Colors.black),
                          onChanged: (value) {
                            controller.contentChapter = value;
                          },
                          maxLength: 500,
                          maxLines: 6,
                          decoration: const InputDecoration(
                            counterText: "",
                            hintText: 'Texto: 500 carácteres...',
                            hintStyle: TextStyle(
                              color: AppColors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Obx(() {
                return Visibility(
                  visible: controller.image?.value != null &&
                      controller.image?.value != '',
                  child: SizedBox(
                    height: 170,
                    width: double.infinity,
                    child: Image.file(
                      File(controller.image?.value ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() {
        return controller.isRecording.value
            ? Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 107,
                    color: AppColors.primary,
                    child: Row(
                      children: [
                        const Spacer(),
                        Center(
                            child: ValueListenableBuilder<int>(
                                valueListenable: timerController,
                                builder: (_, value, __){
                                  return  Text(
                                      '${timerController.hour}:${timerController.minutes}:${timerController.seconds}'
                                  );
                                }
                            )
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () async {
                            await controller.toggleRecording();
                          },
                          child: CircleAvatar(
                            backgroundColor: AppColors.green,
                            radius: 40,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 35,
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () async{
                                      record.value = !record.value;

                                      controller.onRecordPressed();
                                      //  final audio = controller.mRecorder.startRecorder.toString();
                                      // controller.mp3?.value;

                                      // controller.mp3?.value = controller.mRecorder;
                                      if(record.value){
                                        timerController.startTime();
                                      } else {
                                        timerController.pauseTimer();
                                        timerController.cleanTimer();
                                      }

                                    },
                                    child: ValueListenableBuilder<bool>(
                                      valueListenable: record, builder: (ctx, snapshot, _){
                                      return Icon(
                                        snapshot
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        color: AppColors.green,
                                      );
                                    },
                                    ),
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(CircleBorder()),
                                      padding: MaterialStateProperty.all(EdgeInsets.all(23)),
                                      backgroundColor: MaterialStateProperty.all(Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () async{
                              controller.onPlayPressed();
                            },
                            child: Image.asset(AppImages.audio)),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 65,
                    child: GestureDetector(
                      onTap: () {
                        controller.isRecording.value = false;
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppColors.green,
                        radius: 20,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 17,
                          child: Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      child: ElevatedButton(
                        child: Image.asset(AppImages.camera),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          primary: AppColors.primary,
                        ),
                        onPressed: () async {
                          final _picker = ImagePicker();
                          final file = await _picker.pickImage(
                              source: ImageSource.camera);

                          if (file != null) {
                            controller.image?.value = file.path;
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      child: ElevatedButton(
                        child: Image.asset(AppImages.microfone),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          primary: AppColors.primary,
                        ),
                        onPressed: () {
                          controller.isRecording.value = true;
                        },
                      ),
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
