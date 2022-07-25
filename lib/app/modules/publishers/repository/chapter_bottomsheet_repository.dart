import 'package:azerox/app/config/app_constants.dart';
import 'package:dio/dio.dart';

class ChapterBottomsheetEditorRepository {
  final Dio dio;
  ChapterBottomsheetEditorRepository(this.dio);

  Future<void> removeChapterEditorById(int chapterId, int codUserFriendStatus) async {
    final response = await dio.get(
      AppConstants.apiUpdateStatusFriend,
      queryParameters: {
        'CodUserFriend': chapterId,
        'CodUserFriendStatus': codUserFriendStatus
      },
    );
  }
}
