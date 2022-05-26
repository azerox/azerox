
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CaptureCameraImageController extends ValueNotifier<String?> {
  CaptureCameraImageController() : super(null);

  Future<void> capture() async {
    final _picker = ImagePicker();
    final file = await _picker.pickImage(source: ImageSource.camera);
    if (file != null) value = file.path;
  }
}
