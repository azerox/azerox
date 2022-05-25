import 'dart:ui';

import 'package:azerox/app/core/core.dart';

export 'package:just_audio/just_audio.dart';

class MasterAudio {
  final audioPlayer = AudioPlayer();
  VoidCallback? stopSubscriptionCallback;

  Uri? get currentSourceUri => getAudioSourceUri(audioPlayer.audioSource);
  Uri? getAudioSourceUri(AudioSource? source) {
    if (source is LockCachingAudioSource) return source.uri;
    if (source is ProgressiveAudioSource) return source.uri;

    return null;
  }

  Future<Duration?> getAudioDuration(AudioSource source) async {
    final _durationAudioPlayer = AudioPlayer();
    final duration = await _durationAudioPlayer.setAudioSource(source);
    _durationAudioPlayer.dispose();
    return duration;
  }

  Future<Duration?> cacheAudio(String url) async {
    final _durationAudioPlayer = AudioPlayer();
    final source = LockCachingAudioSource(Uri.parse(url));
    final duration = await _durationAudioPlayer.setAudioSource(source);
    _durationAudioPlayer.dispose();
    return duration;
  }

  Future<void> playAudioByUrl({
    required String url,
    required Duration position,
    required VoidCallback stopSubscriptionCallback,
  }) async {
    final uri = Uri.parse(url);
    if (uri != currentSourceUri) {
      if (audioPlayer.playerState.playing) await audioPlayer.stop();
      this.stopSubscriptionCallback?.call();
      this.stopSubscriptionCallback = stopSubscriptionCallback;

      await audioPlayer.setAudioSource(LockCachingAudioSource(uri));
    }
    audioPlayer.seek(position).then((_) => audioPlayer.play());
  }

  Future<void> playAudioBySource({
    required AudioSource source,
    required Duration position,
    required VoidCallback stopSubscriptionCallback,
  }) async {
    final newSourceUri = getAudioSourceUri(source);
    if (newSourceUri != currentSourceUri) {
      if (audioPlayer.playerState.playing) await audioPlayer.stop();
      this.stopSubscriptionCallback?.call();
      this.stopSubscriptionCallback = stopSubscriptionCallback;

      await audioPlayer.setAudioSource(source);
    }
    audioPlayer.seek(position).then((_) => audioPlayer.play());
  }
}
