import 'dart:async';
import 'dart:io';

import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/post.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../create_post_repository.dart';

class CreatePostController extends ChangeNotifier {
  final CreatePostRepository _repository;
  CreatePostController(this._repository);
  final audioController = AudioController();

  String? imagePath;
  String? recordedMp3FilePath;
  String? contentChapter;
  String? titleChapter;

  String dateFormated = DateFormat('dd/MM/yyyy').format(DateTime.now());

  bool isRecordVisible = false;

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

  Future<void> onPickImageFromCameraPressed() async {
    final _picker = ImagePicker();
    final file = await _picker.pickImage(source: ImageSource.camera);

    if (file != null) {
      imagePath = file.path;
      notifyListeners();
    }
  }

  Future<Post> createPost(String? mp3FilePath, String? image) async {
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

  @override
  void dispose() {
    audioController.dispose();
    super.dispose();
  }
}
