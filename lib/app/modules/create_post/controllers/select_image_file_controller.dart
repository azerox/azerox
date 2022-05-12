import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SelectImageFileController extends ValueNotifier<String?> {
  SelectImageFileController() : super(null);

  Future<void> onSelectFilePressed() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      dialogTitle: 'Selecione uma imagem',
      type: FileType.image,
      allowCompression: true,
    );
    if (result == null) return;
    if (result.files.isEmpty) return;

    final file = result.files.first;
    value = file.path;
  }
}
