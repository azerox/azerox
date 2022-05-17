import 'dart:async';
import 'dart:io';

import 'package:azerox/app/config/app_routes.dart';
import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../create_post_repository.dart';
import 'compress_image_controller.dart';

class CreatePostController extends ChangeNotifier {
  final CreatePostRepository _repository;
  CreatePostController(this._repository) {
    compressImageController.addListener(_compressLoadingListener);
  }

  void _compressLoadingListener() {
    if (compressImageController.value.isLoading) {
      loadingController.show('Compactando imagem...');
    } else {
      loadingController.hide();
    }
  }

  final audioController = AudioController();
  final compressImageController = CompressImageController();
  final loadingController = LoadingController();

  String? imagePath;
  String? compressedImagePath;
  String? recordedMp3FilePath;
  String? contentChapter;
  String? titleChapter;

  String dateFormated = DateFormat('dd/MM/yyyy').format(DateTime.now());

  bool isRecordVisible = false;
  bool isLoading = false;

  void onTitleChapterChanged(String newValue) {
    titleChapter = newValue;
    notifyListeners();
  }

  void onContentChapterChanged(String newValue) {
    contentChapter = newValue;
    notifyListeners();
  }

  void onDateTimeChanged(DateTime newValue) {
    dateFormated = DateFormat('dd/MM/yyyy').format(newValue);
    notifyListeners();
  }

  void removeImage() {
    if (imagePath != null) {
      final file = File(imagePath!);
      file.exists().then((exists) async {
        if (exists) await file.delete();
      });
      imagePath = null;
      notifyListeners();
    }
  }

  Future<void> onRemoveMp3File() async {
    if (recordedMp3FilePath != null) {
      await audioController.pause();
      await File(recordedMp3FilePath!).delete();
      recordedMp3FilePath = null;
      await audioController.stop();
      notifyListeners();
    }
  }

  void onOpenRecordDialogPressed() async {
    isRecordVisible = true;
    notifyListeners();
  }

  Future<void> onCloseRecordDialogPressed() async {
    isRecordVisible = false;
    notifyListeners();
  }

  Future<void> onCreatePostPressed() async {
    if (contentChapter != null) {
      try {
        await _compressImageIfNeed();
        loadingController.show('Enviando...');
        await _createPost(recordedMp3FilePath, compressedImagePath);
        Get.offAllNamed(Routes.home);
      } catch (ex, stack) {
        rethrow;
      } finally {
        loadingController.hide();
      }
    }
  }

  Future<void> _compressImageIfNeed() async {
    final isSelectedImage = imagePath != null;
    final isCompressedImage = compressedImagePath != null;
    if (isSelectedImage && !isCompressedImage) {
      final fileBytes = await File(imagePath!).readAsBytes();
      await compressImageController.compressImage(fileBytes, imagePath!);
      compressedImagePath = compressImageController.value.filePath;
    }
  }

  Future<Post> _createPost(String? mp3FilePath, String? image) async {
    final post = await _repository.createPost(
      content: contentChapter!,
      date: dateFormated,
      title: titleChapter!,
      mp3: mp3FilePath,
      image: image,
    );
    if (mp3FilePath != null) await File(mp3FilePath).delete();
    return post;
  }

  Future<void> saveRecord(String recordPath) async {
    recordedMp3FilePath = recordPath;
    audioController.initLocal(recordPath);
    onCloseRecordDialogPressed();
  }

  void selectImage(String imagePath) {
    this.imagePath = imagePath;
    notifyListeners();
  }

  @override
  void dispose() {
    compressImageController.removeListener(_compressLoadingListener);
    audioController.dispose();
    compressImageController.dispose();
    loadingController.hide();
    super.dispose();
  }
}
