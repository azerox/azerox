import 'dart:io';

import 'package:azerox/app/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';

import '../create_post_repository.dart';
import 'timer_controller.dart';

class CreatePostController extends ChangeNotifier {
  final CreatePostRepository _repository;
  CreatePostController(this._repository);

  String? image = '';
  String? mp3 = '';
  String? contentChapter;
  String? titleChapter;

  String dateFormated = DateFormat('dd/MM/yyyy').format(DateTime.now());
  bool isRecording = false;

  void onTitleChapterChanged(String newValue) {
    titleChapter = newValue;
    notifyListeners();
  }

  void onContentChapterChanged(String newValue) {
    contentChapter = newValue;
    notifyListeners();
  }

  void onDateTimeChanged(DateTime newValue) {
    dateFormated = DateFormat('dd/MM/yyyy').format(newValue);
    notifyListeners();
  }

  void onOpenRecordDialogPressed() {
    isRecording = true;
    notifyListeners();
  }

  void onCloseRecordDialogPressed() {
    isRecording = false;
    notifyListeners();
  }

  Future<void> onPickImageFromCameraPressed() async {
    final _picker = ImagePicker();
    final file = await _picker.pickImage(source: ImageSource.camera);

    if (file != null) {
      image = file.path;
    }
  }

  Future<Post> createPost(String? mp3, String? image) async {
    return await _repository.createPost(
      content: contentChapter!,
      date: dateFormated,
      title: titleChapter!,
      mp3: mp3,
      image: image,
    );
  }

  final FlutterSoundRecorder audio = FlutterSoundRecorder();
  final RecordMp3 mRecorder = RecordMp3.instance;
  final FlutterSoundPlayer mPlayer = FlutterSoundPlayer();

  final timerController = TimerController(0);

  bool mPlayerIsInited = false;
  bool mRecorderIsInited = false;
  bool mplaybackReady = false;

  void init() {
    Permission.microphone.request().then((status) {
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
      mRecorderIsInited = true;
      mPlayer.openPlayer().then((value) {
        mPlayerIsInited = true;
      });
    });
  }

  @override
  void dispose() {
    mPlayer.closePlayer();
    timerController.cleanTimer();
    super.dispose();
  }

  void onRecordPressed() {
    if (!mRecorderIsInited || !mPlayer.isStopped) {
      return;
    }

    mRecorder.status == RecordStatus.RECORDING ? stopRecorder() : record();
  }

  void onPlayPressed() {
    if (!mPlayerIsInited ||
        !mplaybackReady ||
        mRecorder.status == RecordStatus.RECORDING) {
      return;
    }

    mPlayer.isStopped ? play() : stopPlayer();
  }

  void record() async {
    timerController.cleanTimer();

    final tempDir = await getTemporaryDirectory();

    mRecorder.start('${tempDir.path}/tau_file.mp3',
        (RecordErrorType errorType) {
      if (errorType == RecordErrorType.PERMISSION_ERROR) {
        Permission.microphone.request().then((status) {
          if (status != PermissionStatus.granted) {
            throw RecordingPermissionException(
                'Microphone permission not granted');
          }

          mRecorderIsInited = true;

          mPlayer.openPlayer().then((value) {
            mPlayerIsInited = true;
          });
        });
      } else {
        mRecorderIsInited = true;
      }
    });
    timerController.startTime();
    mplaybackReady = false;
  }

  void stopRecorder() async {
    mRecorder.stop();

    timerController.pauseTimer();

    final tempDir = await getTemporaryDirectory();
    final arquivo = File('${tempDir.path}/tau_file.mp3');
    mp3 = arquivo.path;
    mplaybackReady = true;
  }

  void play() async {
    if (!mPlayerIsInited ||
        !mplaybackReady ||
        mRecorder.status == RecordStatus.RECORDING ||
        !mPlayer.isStopped) {
      return;
    }

    await mPlayer.startPlayer(
      fromURI: 'tau_file.mp3',
      codec: Codec.mp3,
    );
  }

  void stopPlayer() async {
    if (!mPlayerIsInited ||
        !mplaybackReady ||
        mRecorder.status == RecordStatus.RECORDING ||
        mPlayer.isStopped) {
      return;
    }

    await mPlayer.stopPlayer();
  }

  Future toggleRecording() async {
    audio.isRecording;
  }
}
