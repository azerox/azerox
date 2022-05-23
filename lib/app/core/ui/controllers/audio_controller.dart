import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

export 'package:audioplayers/audioplayers.dart';

class AudioController extends ChangeNotifier {
  AudioPlayer? audioPlayer;
  PlayerState state = PlayerState.PAUSED;
  Duration duration = const Duration();
  Duration position = const Duration();
  final _subscriptions = <StreamSubscription>[];

  AudioController();

  Future<void> initNetwork(String url) async => _init(url, true);
  Future<void> initLocal(String localAudioPath) async {
    return _init(localAudioPath, false);
  }

  Future<void> _init(String url, bool isLocal) async {
    closeSubscriptions();
    audioPlayer = AudioPlayer();
    _subscriptions.add(audioPlayer!.onPlayerStateChanged.listen((state) {
      this.state = state;
      if (state == PlayerState.COMPLETED) {
        audioPlayer!.seek(const Duration(seconds: 0));
        audioPlayer!.pause();
      }
      notifyListeners();
    }));

    _subscriptions.add(audioPlayer!.onDurationChanged.listen((duration) {
      this.duration = duration;
      notifyListeners();
    }));

    _subscriptions.add(audioPlayer!.onAudioPositionChanged.listen((position) {
      this.position = position;
      notifyListeners();
    }));

    await audioPlayer!.setUrl(url, isLocal: isLocal);
    audioPlayer!.pause();
  }

  Future<void> play() async {
    await audioPlayer?.resume();
  }

  Future<void> pause() async {
    await audioPlayer?.pause();
  }

  Future<void> stop() async {
    await audioPlayer!.seek(Duration.zero);
    await audioPlayer?.pause();
  }

  Future<void> seek(Duration position) async {
    await audioPlayer?.seek(position);
  }

  Duration get remainingTime => duration - position;
  String get remainingTimeString {
    final minutes = duration.inMinutes - position.inMinutes;
    final seconds = (duration.inSeconds - position.inSeconds)
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void closeSubscriptions() {
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
    _subscriptions.clear();
  }

  @override
  void dispose() {
    closeSubscriptions();
    super.dispose();
  }
}
