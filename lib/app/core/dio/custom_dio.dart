import 'package:dio/native_imp.dart';

import 'session_id_interceptor.dart';

class CustomDio extends DioForNative {
  CustomDio(String baseUrl) {
    interceptors.add(SessionIdInterceptor());
  }
}
