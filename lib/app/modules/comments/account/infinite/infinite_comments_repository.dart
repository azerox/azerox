import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/config/app_constants.dart';
import 'package:azerox/app/models/post.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';


class InfiniteCommentsRepository {
  final Dio dio;
  InfiniteCommentsRepository(this.dio);

}
