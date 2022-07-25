import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/modules/publishers/repository/chapter_bottomsheet_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


typedef RemoveItemByIdCallback = void Function(int id);

class ChapterBottomsheetEditorController {

  final RemoveItemByIdCallback _removeItemByIdCallback;
  final ChapterBottomsheetEditorRepository chaptersPublisherController;

  final String removeMessageTitle;
  final String removeMessageContent;
  final String removeLoadingText;

  ChapterBottomsheetEditorController.chapter(
    this._removeItemByIdCallback,
    this.chaptersPublisherController,
  )   : removeMessageTitle = 'Remover',
        removeMessageContent = 'Deseja realmente remover este Editor?',
        removeLoadingText = 'Removendo editor...';

  ChapterBottomsheetEditorController.comment(
    this._removeItemByIdCallback,
    this.chaptersPublisherController,
  )   : removeMessageTitle = 'Remover',
        removeMessageContent = 'Deseja realmente remover este Editor?',
        removeLoadingText = 'Removendo editor...';

  final loadingController = LoadingController();

  Future<void> onRemoveEditorItemButtonPressed(
    BuildContext context,
    int chapterId,
    int  codUserFriendStatus,
  ) async {
    try {
      final userConfirmed = await _showConfirmationMessage(context);
      if (userConfirmed) {
        loadingController.show(removeLoadingText);
        await chaptersPublisherController.removeChapterEditorById(chapterId, codUserFriendStatus);
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
          title: Text(removeMessageTitle),
          content: Text(removeMessageContent),
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
