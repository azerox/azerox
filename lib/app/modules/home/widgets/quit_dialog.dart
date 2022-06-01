import 'package:azerox/app/config/app_routes.dart';
import 'package:azerox/app/modules/home/home_controller.dart';
import 'package:azerox/app/modules/home/widgets/drawer/drawer_content_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class QuitDialog extends StatelessWidget {
  const QuitDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    DrawerContentWidget drawerContentWidget = DrawerContentWidget();
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
          onPressed: () {
            Get.offAllNamed(Routes.home);
            drawerContentWidget.controller.selectedIndex = 0;
          }

        ),
        CupertinoDialogAction(
          isDefaultAction: false,
          child: const Text(
            "Sim",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () async {
            Get.offAllNamed(Routes.initial);
            drawerContentWidget.controller.selectedIndex = 0;/* Linha de código para setar menu Home quando fizer login */
          },
        ),
      ],
    );
  }
}
