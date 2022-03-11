import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginErrorDialog extends StatelessWidget {
  final String error;

  const LoginErrorDialog({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text("Aviso"),
      content: Text(error),
      actions: [
        CupertinoDialogAction(
          child: const Text(
            "Ok",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }
}
