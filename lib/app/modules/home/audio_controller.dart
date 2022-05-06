import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioController extends ChangeNotifier {
  AudioPlayer? audioPlayer;
  PlayerState state = PlayerState.PAUSED;
  Duration duration = const Duration();
  Duration position = const Duration();
  final _subscriptions = <StreamSubscription>[];

  AudioController();

  Future<void> init(String audioUrl) async {
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

    await audioPlayer!.setUrl(audioUrl);
    audioPlayer!.pause();
  }

  Future<void> play() async {
    await audioPlayer?.resume();
  }

  Future<void> pause() async {
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

  @override
  void dispose() {
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }
}
