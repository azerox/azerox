import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/modules/configuration/widget/visited_house_card_info_widget.dart';
import 'package:azerox/app/modules/home/home_controller.dart';
import 'package:azerox/app/modules/home/widgets/card_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class VisitedHouseDrawerContentWidget extends GetView<HomeController> {
  final int? editores;
  final bool? showEditores;

  // ignore: use_key_in_widget_constructors
  const VisitedHouseDrawerContentWidget({this.editores, this.showEditores});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return VisitedHouseCardInfoWidget(
            showNet: false,
            showEdit: true,
            color: const Color(0XFF005E6C),
            editor: Get.find<AppController>().currentUser.value,
          );
        }),
      ],
    );
  }
}
