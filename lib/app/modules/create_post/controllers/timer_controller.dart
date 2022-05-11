import 'dart:async';

import 'package:flutter/material.dart';

class TimerController extends ValueNotifier<Duration> {
  TimerController(Duration value) : super(value);
  Timer? timer;
  bool get isRunning => timer != null;

  String get minutes {
    return '${value.inMinutes}'.padLeft(2, '0');
  }

  String get seconds {
    return '${(value.inSeconds % 60).floor()}'.padLeft(2, '0');
  }

  String get time => '$minutes:$seconds';

  void startTime() {
    if (!isRunning) {
      value += const Duration(milliseconds: 1);
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        value += const Duration(seconds: 1);
      });
    }
  }

  void pauseTimer() {
    timer?.cancel();
    timer = null;
    value += const Duration(milliseconds: 1);
  }

  void cleanTimer() {
    timer?.cancel();
    timer = null;
    value = Duration.zero;
  }
}
