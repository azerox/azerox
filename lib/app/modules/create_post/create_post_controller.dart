import 'package:azerox/app/modules/create_post/create_post_repository.dart';
import 'package:azerox/app/modules/create_post/widgets/timer_controller.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';

import '../../models/post.dart';

class CreatePostController extends GetxController {


  final CreatePostRepository _repository;
  CreatePostController(this._repository);


  final RxString? image = ''.obs;
  final RxString? mp3 = ''.obs;
  String? contentChapter;
  String? titleChapter;

  var dateFormated = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;
  final isRecording = false.obs;
  var arquivo;

  Future<Post> createPost(String? mp3, String? image) async {
    return await _repository.createPost(
      content: contentChapter!,
      date: dateFormated.value,
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



  @override
  void onInit() {

    Permission.microphone.request().then((status) {
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
      mRecorderIsInited = true;
      mPlayer.openPlayer().then((value) {
        mPlayerIsInited = true;
      });
    });

    super.onInit();
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
    mp3?.value = arquivo.path;
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
