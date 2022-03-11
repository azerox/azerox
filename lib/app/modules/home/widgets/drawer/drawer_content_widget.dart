import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/modules/home/home_controller.dart';
import 'package:azerox/app/modules/home/widgets/quit_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/app_images.dart';
import '../../../../config/app_routes.dart';
import '../card_info_widget.dart';

class DrawerContentWidget extends GetView<HomeController> {
  final int? editores;
  final bool? showEditores;

  // ignore: use_key_in_widget_constructors
  const DrawerContentWidget({this.editores, this.showEditores});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardInfoWidget(
          showNet: false,
          showEdit: true,
          color: const Color(0XFF005E6C),
          editor: Get.find<AppController>().currentUser,
        ),
        ListTile(
          selectedColor: const Color(0XFF007E94),
          leading: const Icon(
            Icons.house_rounded,
            color: Colors.white,
          ),
          title: const Text(
            'Home',
            style: TextStyle(fontSize: 25),
          ),
          onTap: () {
            Get.offAllNamed(Routes.home);
          },
        ),
        ListTile(
          onTap: () => Get.offAllNamed(Routes.newEditions),
          leading: Image.asset(AppImages.novasEdicoes),
          title: const Text(
            'Novas Edições',
            style: TextStyle(fontSize: 25),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: Image.asset(AppImages.editores),
          title: const Text(
            'Editores',
            style: TextStyle(fontSize: 25),
          ),
          trailing: Visibility(
            visible: showEditores!,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0XFFC01E23),
                borderRadius: BorderRadius.circular(16),
              ),
              width: 40,
              height: 30,
              child: const Center(
                child: Text(
                  '1',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: Image.asset(AppImages.seguinte),
          title: const Text(
            'Seguindo',
            style: TextStyle(fontSize: 25),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          title: const Text(
            'Favoritos',
            style: TextStyle(fontSize: 25),
          ),
          onTap: () {
            Get.offAllNamed(Routes.favoriteds);
          },
        ),
        ListTile(
          onTap: () {},
          leading: Image.asset(AppImages.net1),
          title: const Text(
            'Net',
            style: TextStyle(fontSize: 25),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
          title: const Text(
            'Configurações',
            style: TextStyle(fontSize: 25),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: Image.asset(AppImages.pagarMe),
          title: const Text(
            'Pagar.me',
            style: TextStyle(fontSize: 25),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          title: const Text(
            'MMN',
            style: TextStyle(fontSize: 25),
          ),
        ),
        ListTile(
          leading: Image.asset(AppImages.sair),
          title: const Text(
            'Sair',
            style: TextStyle(fontSize: 25),
          ),
          onTap: () async {
            await showCupertinoDialog(
              context: context,
              builder: (_) {
                return const QuitDialog();
              },
            );
          },
        ),
      ],
    );
  }
}
