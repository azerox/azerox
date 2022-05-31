import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/config/app_routes.dart';
import 'package:azerox/app/modules/home/widgets/drawer/custom_drawer.dart';
import 'package:azerox/app/modules/home/widgets/drawer/drawer_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
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
        title: const Text('Configurações'),
      ),
    );
  }
}
