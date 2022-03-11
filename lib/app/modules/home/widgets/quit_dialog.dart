import 'package:azerox/app/config/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class QuitDialog extends StatelessWidget {
  const QuitDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text("Aviso"),
      content: const Text("Deseja realmente fazer o logout?"),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: false,
          child: const Text(
            "Não",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () => Get.back(),
        ),
        CupertinoDialogAction(
          isDefaultAction: false,
          child: const Text(
            "Sim",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () async {
            Get.offAllNamed(Routes.initial);
          },
        ),
      ],
    );
  }
}
