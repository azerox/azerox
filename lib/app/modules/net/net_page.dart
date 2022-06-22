import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/modules/home/widgets/drawer/custom_drawer.dart';
import 'package:azerox/app/modules/net/net_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetPage extends GetView<NetController> {
  const NetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: Image.asset(AppImages.logo),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 30,
              color: AppColors.primary,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Image.asset(
                    AppImages.net1,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Net',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
