import 'package:azerox/app/config/app_constants.dart';
import 'package:dio/dio.dart';

class ChapterBottomsheetRepository {
  final Dio dio;
  ChapterBottomsheetRepository(this.dio);

  Future<void> removeChapterById(int chapterId) async {
    final response = await dio.get(
      AppConstants.apiDeletePost,
      queryParameters: {'CodPost': chapterId},
    );
  }
}
