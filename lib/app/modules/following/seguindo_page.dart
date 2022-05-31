
import 'package:azerox/app/config/app_routes.dart';
import 'package:azerox/app/modules/home/widgets/drawer/drawer_content_widget.dart';
import 'package:azerox/app/modules/publishers/editores_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeguindoPage extends GetView<EditoresController> {
  const SeguindoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    DrawerContentWidget drawerContentWidget = DrawerContentWidget();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed(Routes.home);
              drawerContentWidget.controller.selectedIndex = 0;
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Seguindo'),
      ),
    );
  }
}
