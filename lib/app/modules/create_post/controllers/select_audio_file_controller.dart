import 'dart:math';

import 'package:azerox/app/config/app_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SelectAudioFileController extends ValueNotifier<String?> {
  final int maxAudioFileBytes;
  SelectAudioFileController(this.maxAudioFileBytes) : super(null);

  Future<void> onSelectFilePressed(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: ['mp3'],
      dialogTitle: 'Selecione um arquivo de áudio',
      type: FileType.custom,
    );
    if (result == null) return;
    if (result.files.isEmpty) return;
    if (result.files.first.size > maxAudioFileBytes) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Arquivo muito grande'),
          content: Text(
            'O arquivo selecionado tem ${filesize(result.files.first.size, 2)}\n'
            'Selecione um arquivo de no máximo ${filesize(maxAudioFileBytes)}',
          ),
          actions: [
            OutlinedButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('OK'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(AppColors.grey),
              ),
            )
          ],
        ),
      );
      return;
    }
    value = result.files.first.path;
  }

  String filesize(int bytes, [int decimals = 0]) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1000)).floor();
    return ((bytes / pow(1000, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }
}
