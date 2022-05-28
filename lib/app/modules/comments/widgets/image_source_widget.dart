import 'package:azerox/app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/create_comment_controller.dart';

class ImageSourceWidget extends StatefulWidget {
  const ImageSourceWidget({Key? key}) : super(key: key);

  @override
  State<ImageSourceWidget> createState() => _ImageSourceWidgetState();
}

class _ImageSourceWidgetState extends State<ImageSourceWidget> {
  final CreateCommentController controller = GetInstance().find();

  final galeryController = SelectImageFileController();
  final cameraController = CaptureCameraImageController();

  @override
  void initState() {
    super.initState();

    galeryController.addListener(() {
      final filePath = galeryController.value;
      final valueIsNull = filePath != null;
      final valueIsEquals = filePath != controller.recordedMp3FilePath;

      if (valueIsNull && valueIsEquals) {
        controller.selectImage(filePath);
        Navigator.of(context).pop();
      }
    });

    cameraController.addListener(() {
      final filePath = cameraController.value;
      if (filePath != null) {
        controller.selectImage(filePath);
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    galeryController.dispose();
    cameraController.dispose();
    // compressionController.dispose();
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
