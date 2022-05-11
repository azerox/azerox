import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/create_post_controller.dart';
import '../controllers/select_image_file_controller.dart';

class ImageSourceWidget extends StatefulWidget {
  const ImageSourceWidget({Key? key}) : super(key: key);

  @override
  State<ImageSourceWidget> createState() => _ImageSourceWidgetState();
}

class _ImageSourceWidgetState extends State<ImageSourceWidget> {
  final CreatePostController controller = GetInstance().find();

  final galeryController = SelectImageFileController();

  @override
  void initState() {
    super.initState();
    galeryController.addListener(() {
      final valueIsNull = galeryController.value != null;
      final valueIsEquals =
          galeryController.value != controller.recordedMp3FilePath;

      if (valueIsNull && valueIsEquals) {
        controller.selectImage(galeryController.value!);
      }
    });
  }

  @override
  void dispose() {
    galeryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 28,
      ),
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
              await controller.onPickImageFromCameraPressed();
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Galeria'),
            onTap: () async {
              await galeryController.onSelectFilePressed(context);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
