import 'package:azerox/app/app_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class SessionIdInterceptor extends Interceptor {
  String? cookie;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    cookie = response.headers.value('set-cookie');
    if (cookie != null) {
      final newSessionId =
          RegExp(r'ASP.NET_SessionId=(\w*);').firstMatch(cookie!)?.group(1);
      final AppController appController = Get.find();
      appController.currentUser.value =
          appController.currentUser.value.copyWith(sessionID: newSessionId);
    }
    handler.next(response);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final AppController appController = Get.find();
    if (cookie != null) options.headers.addAll({'Cookie': cookie});
    if (appController.currentUser.value.sessionID != null) {
      options.queryParameters['sessionId'] =
          appController.currentUser.value.sessionID;
    }
    handler.next(options);
  }
}
