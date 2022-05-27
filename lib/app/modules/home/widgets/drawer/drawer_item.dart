import 'package:azerox/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Widget icon;
  final VoidCallback onTap;
  const DrawerItem({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  DrawerItem.fromJson({
    required Map json,
    required int index,
    VoidCallback? onTap,
  })  : title = json['titulo'],
        icon = json['icone'],
        isSelected = Get.find<HomeController>().selectedIndex == index,
        this.onTap = onTap ??
            (() {
              Get.find<HomeController>().selectedIndex = index;
              Get.offNamed(json['rota']);
            });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0XFF007E94),
      elevation: 3,
      child: ListTile(
        leading: icon,
        onTap: onTap,
        selected: isSelected,
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.blue[300] : Colors.white,
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}
