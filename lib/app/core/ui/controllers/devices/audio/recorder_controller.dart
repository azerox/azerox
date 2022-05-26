import 'dart:async';
import 'dart:io';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class RecorderController extends ChangeNotifier {
  StreamSubscription? _recorderSubscription;
  FlutterSoundRecorder recorderModule = FlutterSoundRecorder();

  String recorderTxt = '00:00:00';
  double? dbLevel;

  final Codec _codec = Codec.defaultCodec;
  String? recordedFilePath;

  bool isRecording = false;

  Future<void> init() async {
    await openRecorder();

    await recorderModule
        .setSubscriptionDuration(const Duration(milliseconds: 10));

    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
      avAudioSessionCategoryOptions:
          AVAudioSessionCategoryOptions.allowBluetooth |
              AVAudioSessionCategoryOptions.defaultToSpeaker,
      avAudioSessionMode: AVAudioSessionMode.spokenAudio,
      avAudioSessionRouteSharingPolicy:
          AVAudioSessionRouteSharingPolicy.defaultPolicy,
      avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      androidAudioAttributes: const AndroidAudioAttributes(
        contentType: AndroidAudioContentType.speech,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.voiceCommunication,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      androidWillPauseWhenDucked: true,
    ));
  }

  Future<void> openRecorder() async {
    var status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }

    await recorderModule.openRecorder();
  }

  void cancelRecorderSubscriptions() {
    if (_recorderSubscription != null) {
      _recorderSubscription!.cancel();
      _recorderSubscription = null;
    }
  }

  Future<void> releaseFlauto() async {
    try {
      await recorderModule.closeRecorder();
    } on Exception {
      recorderModule.logger.e('Released unsuccessful');
    }
  }

  Future<void> startRecorder() async {
    try {
      // Request Microphone permission if needed

      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }

      var path = '';

      var tempDir = await getTemporaryDirectory();
      path = '${tempDir.path}/flutter_sound${ext[_codec.index]}';

      await recorderModule.startRecorder(
        toFile: path,
        codec: _codec,
        bitRate: 8000,
        numChannels: 1,
        sampleRate: (_codec == Codec.pcm16)
            ? 44000 // 44100 does not work for recorder on iOS
            : 8000, //tSAMPLERATE
      );

      recorderModule.logger.d('startRecorder');

      _recorderSubscription = recorderModule.onProgress!.listen((e) {
        var date = DateTime.fromMillisecondsSinceEpoch(
            e.duration.inMilliseconds,
            isUtc: true);
        var txt = DateFormat('mm:ss:SS', 'en_GB').format(date);

        recorderTxt = txt.substring(0, 8);
        dbLevel = e.decibels;
        notifyListeners();
      });

      isRecording = true;
      recordedFilePath = path;
      notifyListeners();
    } on Exception catch (err) {
      recorderModule.logger.e('startRecorder error: $err');
      stopRecorder();
      isRecording = false;
      cancelRecorderSubscriptions();
      notifyListeners();
    }
  }

  Future<void> stopRecorder() async {
    try {
      await recorderModule.stopRecorder();
      recorderModule.logger.d('stopRecorder');
      cancelRecorderSubscriptions();
    } on Exception catch (err) {
      recorderModule.logger.d('stopRecorder error: $err');
    }
    isRecording = false;
    notifyListeners();
  }

  Future<bool> fileExists(String path) async {
    return await File(path).exists();
  }

  void pauseResumeRecorder() async {
    try {
      if (recorderModule.isPaused) {
        await recorderModule.resumeRecorder();
      } else {
        await recorderModule.pauseRecorder();
        assert(recorderModule.isPaused);
      }
    } on Exception catch (err) {
      recorderModule.logger.e('error: $err');
    }
    notifyListeners();
  }

  ///TODO: Buttons Commands

  void Function()? onPauseResumeRecorderPressed() {
    if (recorderModule.isPaused || recorderModule.isRecording) {
      return pauseResumeRecorder;
    }
    return null;
  }

  void startStopRecorder() {
    if (recorderModule.isRecording || recorderModule.isPaused) {
      stopRecorder();
    } else {
      startRecorder();
    }
  }

  void Function() onStartRecorder() {
    if (recorderModule.isPaused) {
      isRecording = true;
      notifyListeners();
      return recorderModule.resumeRecorder;
    } else {
      return startRecorder;
    }
  }

  void Function() onPauseRecorder() {
    isRecording = false;
    notifyListeners();
    return recorderModule.pauseRecorder;
  }

  @override
  void dispose() {
    super.dispose();
    cancelRecorderSubscriptions();
    releaseFlauto();
  }
}
