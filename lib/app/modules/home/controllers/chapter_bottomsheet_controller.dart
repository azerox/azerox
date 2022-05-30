import 'package:azerox/app/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../repositories/chapter_bottomsheet_repository.dart';

typedef RemoveItemByIdCallback = void Function(int id);

class ChapterBottomsheetController {
  final RemoveItemByIdCallback _removeItemByIdCallback;
  final ChapterBottomsheetRepository _repository;

  ChapterBottomsheetController(
    this._removeItemByIdCallback,
    this._repository,
  );

  final loadingController = LoadingController();

  Future<void> onRemoveItemButtonPressed(
    BuildContext context,
    int chapterId,
  ) async {
    try {
      final userConfirmed = await _showConfirmationMessage(context);
      if (userConfirmed) {
        loadingController.show('Removendo capítulo...');
        await _repository.removeChapterById(chapterId);
        _removeItemByIdCallback(chapterId);
        Get.back();
      }
    } finally {
      loadingController.hide();
    }
  }

  Future<bool> _showConfirmationMessage(BuildContext context) async {
    return await showCupertinoDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: const Text("Remover"),
          content: const Text("Deseja realmente remover este Capítulo?"),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: false,
              child: const Text(
                "Cancelar",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () => Get.back(result: false),
            ),
            CupertinoDialogAction(
              isDefaultAction: false,
              child: const Text(
                "Sim",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () => Get.back(result: true),
            ),
          ],
        );
      },
    );
  }
}
