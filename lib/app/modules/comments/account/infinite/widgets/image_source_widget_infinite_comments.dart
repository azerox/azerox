import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/core/ui/controllers/devices/image/capture_image_controller.dart';
import 'package:azerox/app/core/ui/controllers/devices/image/select_image_file_controller.dart';
import 'package:azerox/app/modules/comments/account/infinite/infinite_comments_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageSourceWidgetInfiniteComment extends StatefulWidget {
  const ImageSourceWidgetInfiniteComment({Key? key}) : super(key: key);

  @override
  State<ImageSourceWidgetInfiniteComment> createState() => _ImageSourceWidgetInfiniteCommentState();
}

class _ImageSourceWidgetInfiniteCommentState extends State<ImageSourceWidgetInfiniteComment> {
  final InfiniteCommentsController controller = GetInstance().find();

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
