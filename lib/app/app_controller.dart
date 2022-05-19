import 'package:get/get.dart';

import 'models/user.dart';

class AppController extends GetxController {
  Rx<UserModel> currentUser = UserModel(name: 'NaN').obs;
}
