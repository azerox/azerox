import 'dart:async';
import 'package:flutter/material.dart';

class TimerController extends ValueNotifier<int>{
  TimerController(int value) : super(value);
  bool running = false;

  String get hour {
    return '${(value / (60 * 60)).floor()}'.padLeft(2, '0');
  }

  String get minutes {
    return '${(value /  60).floor()}'.padLeft(2, '0');
  }

  String get seconds {
    return '${(value %  60).floor()}'.padLeft(2, '0');
  }

  void startTime() {
    if (!running) {
      running = true;
      Timer.periodic(const Duration(), (timer) {
        if (!running){
          timer.cancel();
        } else {
          value += 1;
        }
      });
    } else {
      running = false;
    }
  }

  void pauseTimer() => running = false;
  void cleanTimer() => value = 0;

}