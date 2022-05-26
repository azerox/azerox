import 'dart:io';

import 'package:azerox/app/config/app_routes.dart';
import 'package:azerox/app/core/ui/controllers/audio_controller.dart';
import 'package:azerox/app/core/ui/controllers/devices/image/compress_image_controller.dart';
import 'package:azerox/app/core/ui/controllers/loading_controller.dart';
import 'package:azerox/app/models/post.dart';
import 'package:azerox/app/modules/comments/account/infinite/infinite_comments_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InfiniteCommentsController extends ChangeNotifier {
  final InfiniteCommentsRepository _repository;
  InfiniteCommentsController(this._repository) {
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


  bool isRecordVisible = false;
  bool isLoading = false;



  void onContentChapterChanged(String newValue) {
    contentChapter = newValue;
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
