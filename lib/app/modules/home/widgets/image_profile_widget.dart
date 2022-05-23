import 'dart:io';

import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/modules/create_post/controllers/capture_image_controller.dart';
import 'package:azerox/app/modules/create_post/controllers/compress_image_controller.dart';
import 'package:azerox/app/modules/create_post/controllers/select_image_file_controller.dart';
import 'package:azerox/app/modules/home/controllers/chapters_controller.dart';
import 'package:azerox/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageProfileWidget extends StatefulWidget {
  const ImageProfileWidget({Key? key}) : super(key: key);

  @override
  State<ImageProfileWidget> createState() => _ImageProfileWidgetState();
}

class _ImageProfileWidgetState extends State<ImageProfileWidget> {
  final controller = Get.find<HomeController>();
  final chaptersController = Get.find<ChaptersController>();
  final galeryController = SelectImageFileController();
  final cameraController = CaptureCameraImageController();
  final compressionController = CompressImageController();
  final loadingController = LoadingController();

  Future<void> _compressImage(String filePath) async {
    final fileBytes = await File(filePath).readAsBytes();
    await compressionController.compressImage(fileBytes, filePath);
  }

  Future<String?> _cropImage(String imagePath) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    return croppedFile?.path;
  }

  @override
  void dispose() {
    super.dispose();
    galeryController.dispose();
    cameraController.dispose();
    compressionController.dispose();
    loadingController.hide();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 30, top: 16),
            color: const Color(0XFFC4C4C4),
            height: 6,
            width: 54,
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Câmera'),
            onTap: () async {
              try {
                await cameraController.capture();
                final filePath = cameraController.value;
                if (filePath == null) return;

                final croppedImage = await _cropImage(filePath);
                if (croppedImage == null) return;

                loadingController.show('Compactando imagem...');
                await _compressImage(filePath);
                final compressedFilePath = compressionController.value.filePath;
                if (compressedFilePath == null) return;

                loadingController.show('Enviando...');
                await controller.updateImageProfile(compressedFilePath);
                chaptersController.refreshItems();
                Navigator.of(context).pop();
              } catch (ex, stack) {
                rethrow;
              } finally {
                loadingController.hide();
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Galeria'),
            onTap: () async {
              try {
                await galeryController.onSelectFilePressed();
                final filePath = galeryController.value;
                if (filePath == null) return;

                final croppedImage = await _cropImage(filePath);
                if (croppedImage == null) return;

                loadingController.show('Compactando imagem...');
                await _compressImage(croppedImage);
                final compressedFilePath = compressionController.value.filePath;
                if (compressedFilePath == null) return;

                loadingController.show('Enviando...');
                await controller.updateImageProfile(compressedFilePath);
                chaptersController.refreshItems();
                Navigator.of(context).pop();
              } catch (ex, stack) {
                rethrow;
              } finally {
                loadingController.hide();
              }
            },
          ),
        ],
      ),
    );
  }
}
