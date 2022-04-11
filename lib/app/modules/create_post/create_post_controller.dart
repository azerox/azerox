import 'package:azerox/app/modules/create_post/create_post_repository.dart';
import 'package:azerox/app/modules/create_post/widgets/timer_controller.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../models/post.dart';

class CreatePostController extends GetxController {
  final CreatePostRepository _repository;
  CreatePostController(this._repository);

  final RxString? image = ''.obs;
  String? contentChapter;
  String? titleChapter;
  String? mp3;
  var dateFormated = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;
  final isRecording = false.obs;


  Future<Post> createPost(String? mp3, String? image) async {
    return await _repository.createPost(
      content: contentChapter!,
      date: dateFormated.value,
      title: titleChapter!,
      mp3: mp3,
      image: image,
    );
  }
  final FlutterSoundRecorder mRecorder = FlutterSoundRecorder();
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

      mRecorder.openRecorder().then((value) {
        mRecorderIsInited = true;
      });

      mPlayer.openPlayer().then((value) {
        mPlayerIsInited = true;
      });
    });

    super.onInit();
  }

  @override
  void dispose() {
    mRecorder.closeRecorder();
    mPlayer.closePlayer();
    timerController.cleanTimer();

    super.dispose();
  }

  void onRecordPressed() async {
    timerController.startTime();
    if ( !mRecorderIsInited || !mPlayer.isStopped) {
      return;
    }

    await mRecorder.isStopped ? recordAudio() : stopRecorder();
  }

  void onPlayPressed() async {
    if ( !mPlayerIsInited || !mplaybackReady || !mRecorder.isStopped) {
      return;
    }
    await mPlayer.isStopped ? play() : stopPlayer();
  }

  void recordAudio() async {
    timerController.cleanTimer();

    await mRecorder.startRecorder(
      toFile: 'tau_file.mp4',
      codec: Codec.aacMP4,
      audioSource: AudioSource.microphone,
    );

    final tempDir = await getTemporaryDirectory();
    final arquivo = File('${tempDir.path}/tau_file.mp4');
    final arquivoBytes = await arquivo.readAsBytes();
    mp3 = base64.encode(arquivoBytes);
  
    timerController.startTime();
    mplaybackReady = false;
  }

  void stopRecorder() async {
    await mRecorder.stopRecorder();

    timerController.pauseTimer();
    mplaybackReady = true;
  }

  void play() async {
    if (!mPlayerIsInited ||
        !mplaybackReady ||
        !mRecorder.isStopped ||
        !mPlayer.isStopped) {
      return;
    }

    await mPlayer.startPlayer(
      fromURI: 'tau_file.mp4',
    );

  }

  void stopPlayer() async {
    if (!mPlayerIsInited ||
        !mplaybackReady ||
        !mRecorder.isStopped ||
        mPlayer.isStopped) {
      return;
    }

    await mPlayer.stopPlayer();
  }

  Future stop() async {
    await mRecorder.stopRecorder();
    mRecorder.recordingData();
  }

  Future toggleRecording() async {
    mRecorder.isRecording;
  }
}
