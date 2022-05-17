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

    @override
    void initState() {
      super.initState();

      galeryController.addListener(() async {
        final filePath = galeryController.value;
        final valueIsNull = filePath != null;

        if (valueIsNull) {
          final fileBytes = await File(filePath).readAsBytes();
          await compressionController.compressImage(fileBytes, filePath);
        }
      });

      cameraController.addListener(() async {
        final filePath = cameraController.value;
        if (filePath != null) {
          final fileBytes = await File(filePath).readAsBytes();
          await compressionController.compressImage(fileBytes, filePath);
        }
      });

      void _cropImage(filePath) async {
        await ImageCropper().cropImage(
            sourcePath: filePath, maxHeight: 1080, maxWidth: 1080);
        await controller.updateImageProfile(
            controller.imagePath);
      }


      compressionController.addListener(() {
        final compressedFilePath = compressionController.value.filePath;

        if (compressedFilePath != null) {
          _cropImage(compressedFilePath);
          controller.selectImage(compressedFilePath);
          Navigator.of(context).pop();
        }
      });
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
              onTap: cameraController.capture,
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Galeria'),
              onTap: galeryController.onSelectFilePressed,
            ),
          ],
        ),
      );
    }

}
