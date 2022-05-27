import 'dart:async';

import 'package:flutter/material.dart';

import 'master_audio_controller.dart';

export 'package:just_audio/just_audio.dart';

class AudioController extends ChangeNotifier {
  static final master = MasterAudio();
  PlayerState state = PlayerState(false, ProcessingState.loading);
  var duration = Duration.zero;
  var position = Duration.zero;
  final _subscriptions = <StreamSubscription>[];

  AudioSource? _source;
  AudioSource get source {
    if (_source == null) {
      throw Exception(
        "The source cannot be null. Call `initNetwork()` or `initFile()` before",
      );
    }
    return _source!;
  }

  bool get isCurrentAudioPlaying {
    final playingSourceUri = master.getAudioSourceUri(_source);
    return (playingSourceUri != null) &&
        (master.currentSourceUri == playingSourceUri);
  }

  Future<void> initNetwork(String url) async {
    _source = LockCachingAudioSource(Uri.parse(url));
    final duration = await master.cacheAudio(url);
    _setDuration(duration);
  }

  Future<void> initFile(String filePath) async {
    _source = ProgressiveAudioSource(Uri.parse(filePath));
    final duration = await master.getAudioDuration(source);
    _setDuration(duration);
  }

  Future<void> play() async {
    try {
      await master.playAudioBySource(
        source: source,
        position: position,
        stopSubscriptionCallback: _closeSubscriptions,
      );
      _startSubscriptions();
    } catch (ex, stack) {
      print(ex);
      print(stack);
    }
  }

  Future<void> pause() async {
    await master.audioPlayer.pause();
  }

  Future<void> stop() async {
    await master.audioPlayer.seek(Duration.zero);
    await master.audioPlayer.pause();
  }

  Future<void> seek(Duration position) async {
    await master.audioPlayer.seek(position);
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

  void _closeSubscriptions() {
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
    _subscriptions.clear();
  }

  void _setPlayerState(PlayerState state) {
    this.state = state;
    if (state.processingState == ProcessingState.completed) {
      master.audioPlayer.seek(const Duration(seconds: 0));
      master.audioPlayer.pause();
    }
    notifyListeners();
  }

  void _setDuration(Duration? duration) {
    this.duration = duration ?? Duration.zero;
    notifyListeners();
  }

  void _setPosition(Duration position) {
    this.position = position;
    notifyListeners();
  }

  void _startSubscriptions() {
    if (isCurrentAudioPlaying) {
      _subscriptions
          .add(master.audioPlayer.playerStateStream.listen(_setPlayerState));
      _subscriptions
          .add(master.audioPlayer.positionStream.listen(_setPosition));
    } else {
      _closeSubscriptions();
      this.state = PlayerState(false, ProcessingState.ready);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _closeSubscriptions();
    if (isCurrentAudioPlaying) master.audioPlayer.stop();
    super.dispose();
  }
}
