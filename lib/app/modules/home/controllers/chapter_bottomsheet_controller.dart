import 'package:azerox/app/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../home_repository.dart';
import 'chapters_controller.dart';

class ChapterBottomsheetController {
  final ChaptersController chaptersController;
  final HomeRepository _repository;

  ChapterBottomsheetController(
    this.chaptersController,
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
        chaptersController.removeChapterById(chapterId);
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
