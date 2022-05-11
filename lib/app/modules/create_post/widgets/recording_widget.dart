// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/config/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/create_post_controller.dart';
import '../controllers/recorder_controller.dart';

class RecordingWidget extends StatefulWidget {
  const RecordingWidget({Key? key}) : super(key: key);

  @override
  State<RecordingWidget> createState() => _RecordingWidgetState();
}

class _RecordingWidgetState extends State<RecordingWidget> {
  final CreatePostController controller = GetInstance().find();
  final recorderController = RecorderController();
  final maxRecordDuration = const Duration(seconds: 90);

  StreamSubscription? maxRecordDurationSubscription;

  @override
  void initState() {
    super.initState();
    recorderController.init().then((_) {
      maxRecordDurationSubscription =
          recorderController.recorderModule.onProgress!.listen((state) {
        if (state.duration >= maxRecordDuration) saveRecord();
      });
    });
  }

  @override
  void dispose() {
    maxRecordDurationSubscription?.cancel();
    recorderController.dispose();
    super.dispose();
  }

  void saveRecord() {
    recorderController.stopRecorder();
    final filePath = recorderController.recordedFilePath;
    if (filePath != null) controller.saveRecord(filePath);
  }

  String formatDuration(Duration duration) {
    var date = DateTime.fromMillisecondsSinceEpoch(
      duration.inMilliseconds,
      isUtc: true,
    );
    var txt = DateFormat('mm:ss:SS', 'en_GB').format(date);
    return txt.substring(0, 8);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: recorderController,
      builder: (context, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!recorderController.isRecording) ...{
              Text(
                recorderController.recorderTxt,
                style: TextStyle(fontSize: 20),
              ),
            },
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: controller.onCloseRecordDialogPressed,
                    icon: Icon(Icons.delete),
                    iconSize: 27,
                    color: AppColors.grey,
                  ),
                  if (!recorderController.recorderModule.isRecording) ...{
                    IconButton(
                      onPressed: recorderController.onStartRecorder(),
                      icon: Icon(Icons.mic_rounded),
                      iconSize: 35,
                      color: Colors.red,
                    ),
                  },
                  if (recorderController.isRecording) ...{
                    Column(
                      children: [
                        Text(
                          recorderController.recorderTxt,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'max ${formatDuration(maxRecordDuration)}',
                          style: TextStyle(fontSize: 15, color: Colors.red),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  },
                  if (recorderController.isRecording) ...{
                    FloatingActionButton(
                      mini: true,
                      child: Icon(Icons.check, size: 25),
                      backgroundColor: AppColors.primary,
                      onPressed: saveRecord,
                    ),
                  },
                  if (recorderController.recorderModule.isStopped) ...{
                    IconButton(
                      // icon: Icon(Icons.check, color: Colors.green),
                      icon: Image.asset(AppImages.audio,
                          color: AppColors.primary),
                      onPressed: () {},
                    ),
                  },
                ],
              ),
            )
          ],
        );
      },
    );
  }
}