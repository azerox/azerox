import 'dart:io';

import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/modules/create_post/controllers/capture_image_controller.dart';
import 'package:azerox/app/modules/create_post/controllers/compress_image_controller.dart';
import 'package:azerox/app/modules/create_post/controllers/select_image_file_controller.dart';
import 'package:azerox/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageProfileWidget extends StatefulWidget {
  const ImageProfileWidget({Key? key}) : super(key: key);

  @override
  State<ImageProfileWidget> createState() => _ImageProfileWidgetState();
}

class _ImageProfileWidgetState extends State<ImageProfileWidget>
    with NotifierLoadingMixin {
  final HomeController controller = GetInstance().find();
  final galeryController = SelectImageFileController();
  final cameraController = CaptureCameraImageController();
  final compressionController = CompressImageController();

  @override
  late final loadingNotifier = compressionController;

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
  }

  @override
  Widget loadingBuilder(BuildContext context) {
    return Container(
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
          Text("Comprimindo imagem",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: AppColors.primary)),
        ],
      ),
    );
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
              await cameraController.capture();
              final filePath = cameraController.value;
              if (filePath == null) return;

              final croppedImage = await _cropImage(filePath);
              if (croppedImage == null) return;

              await _compressImage(filePath);
              final compressedFilePath = compressionController.value.filePath;
              if (compressedFilePath == null) return;

              await controller.updateImageProfile(compressedFilePath);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Galeria'),
            onTap: () async {
              await galeryController.onSelectFilePressed();
              final filePath = galeryController.value;
              if (filePath == null) return;

              final croppedImage = await _cropImage(filePath);
              if (croppedImage == null) return;

              await _compressImage(filePath);
              final compressedFilePath = compressionController.value.filePath;
              if (compressedFilePath == null) return;

              await controller.updateImageProfile(compressedFilePath);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
