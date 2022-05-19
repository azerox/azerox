import 'dart:async';

import 'package:azerox/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingController {
  Completer? _completer;

  void hide() {
    _completer?.complete(null);
    _completer = null;
  }

  Future<void> show([String loadingText = "Carregando"]) async {
    if (_completer != null) hide();
    _completer = Completer();
    Get.showOverlay(
      asyncFunction: () => _completer!.future,
      loadingWidget: _loadingBuilder(loadingText),
    );
    await _completer!.future;
  }

  void showCustom(Widget loadingWidget) {
    if (_completer != null) hide();
    _completer = Completer();
    Get.showOverlay(
      asyncFunction: () => _completer!.future,
      loadingWidget: loadingWidget,
      opacityColor: Colors.transparent,
    );
  }

  Widget _loadingBuilder(String loadingText) {
    return Material(
      color: Colors.black.withOpacity(0.2),
      child: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppColors.primary),
              ),
              const SizedBox(height: 15),
              Text(loadingText,
                  style: const TextStyle(color: AppColors.primary)),
            ],
          ),
        ),
      ),
    );
  }
}
