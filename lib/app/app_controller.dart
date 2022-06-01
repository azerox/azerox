import 'package:get/get.dart';

import 'models/assinante_model.dart';
import 'models/user.dart';

class AppController extends GetxController {
  Rx<UserModel> currentUser = UserModel(name:'NaN').obs;
  Rx<AssinanteModel> currentAssinante = AssinanteModel(name: 'NaN').obs;
}
