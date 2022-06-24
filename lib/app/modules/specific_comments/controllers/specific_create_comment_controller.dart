import 'dart:io';

import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repositories/specific_comments_repository.dart';

class SpecificCreateCommentController extends ChangeNotifier {
  final SpecificCommentsRepository _repository;
  SpecificCreateCommentController(this._repository) {
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
  String? contentComment;
  Post? _chapter;

  bool isRecordVisible = false;
  bool isLoading = false;

  void setChapter(Post chapter) => _chapter = chapter;

  void onCommentContentChanged(String newValue) {
    contentComment = newValue;
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

  Future<void> onCreateCommentPressed() async {
    if (contentComment != null) {
      try {
        await _compressImageIfNeed();
        loadingController.show('Enviando...');
        final newComment =
            await _createComment(recordedMp3FilePath, compressedImagePath);
        Get.back(result: newComment);
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

  Future<Post> _createComment(String? mp3FilePath, String? image) async {
    final post = await _repository.createComment(
      content: contentComment!,
      mp3: mp3FilePath,
      image: image,
      masterChapterId: _chapter!.codPost!,
    );
    if (mp3FilePath != null) await File(mp3FilePath).delete();
    return post;
  }

  Future<void> saveRecord(String recordPath) async {
    recordedMp3FilePath = recordPath;
    audioController.initFile(recordPath);
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
