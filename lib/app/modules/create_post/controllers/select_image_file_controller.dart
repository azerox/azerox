import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SelectImageFileController extends ValueNotifier<String?> {
  SelectImageFileController() : super(null);

  Future<void> onSelectFilePressed(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      dialogTitle: 'Selecione uma imagem',
      type: FileType.image,
    );
    if (result == null) return;
    if (result.files.isEmpty) return;

    value = result.files.first.path;
  }
}
