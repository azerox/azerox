import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/config/app_colors.dart';
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
        Obx(() {
          return CardInfoWidget(
            showNet: false,
            showEdit: true,
            color: const Color(0XFF005E6C),
            editor: Get.find<AppController>().currentUser.value,
          );
        }),
        Column(
          children: [
            Obx(() => SingleChildScrollView(
                  child: SizedBox(
                    child: Column(
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: controller.items.length,
                          itemBuilder: (_, index) {
                            final _item = controller.items[index];
                            if (_item['rota'] == Routes.home) {
                              return Obx(
                                () => Container(
                                  decoration:
                                      (controller.selectedIndex == index)
                                          ? const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                                bottom: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                              ),
                                            )
                                          : null,
                                  child: Obx(
                                    () => Card(
                                      color: const Color(0XFF007E94),
                                      elevation: 3,
                                      child: ListTile(
                                          title: Text(
                                            _item['titulo'],
                                            style: TextStyle(
                                                color:
                                                    (controller.selectedIndex ==
                                                            index)
                                                        ? AppColors.green
                                                        : Colors.white,
                                                fontSize: 19),
                                          ),
                                          leading: Image.asset(_item['icone'],
                                              color:
                                                  (controller.selectedIndex ==
                                                          index)
                                                      ? AppColors.green
                                                      : Colors.white),
                                          onTap: () {
                                            controller.selectedIndex = index;
                                            Get.offNamed(_item['rota']);
                                          },
                                          selected: controller.selectedIndex ==
                                              index),
                                    ),
                                  ),
                                ),
                              );
                            } else if (_item['rota'] == Routes.newEditions) {
                              return Obx(
                                () => Container(
                                  decoration:
                                      (controller.selectedIndex == index)
                                          ? const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                                bottom: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                              ),
                                            )
                                          : null,
                                  child: Obx(
                                    () => Card(
                                      color: const Color(0XFF007E94),
                                      elevation: 3,
                                      child: ListTile(
                                          title: Text(
                                            _item['titulo'],
                                            style: TextStyle(
                                                color:
                                                    (controller.selectedIndex ==
                                                            index)
                                                        ? AppColors.green
                                                        : Colors.white,
                                                fontSize: 19),
                                          ),
                                          leading: Image.asset(_item['icone'],
                                              color:
                                                  (controller.selectedIndex ==
                                                          index)
                                                      ? AppColors.green
                                                      : Colors.white),
                                          onTap: () {
                                            controller.selectedIndex = index;
                                            Get.offNamed(_item['rota']);
                                          },
                                          selected: controller.selectedIndex ==
                                              index),
                                    ),
                                  ),
                                ),
                              );
                            } else if (_item['rota'] == Routes.publishers) {
                              return Obx(
                                () => Container(
                                  decoration:
                                      (controller.selectedIndex == index)
                                          ? const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                                bottom: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                              ),
                                            )
                                          : null,
                                  child: Obx(
                                    () => Card(
                                      color: const Color(0XFF007E94),
                                      elevation: 3,
                                      child: ListTile(
                                          title: Text(
                                            _item['titulo'],
                                            style: TextStyle(
                                                color:
                                                    (controller.selectedIndex ==
                                                            index)
                                                        ? AppColors.green
                                                        : Colors.white,
                                                fontSize: 19),
                                          ),
                                          trailing: Visibility(
                                            visible: showEditores!,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0XFFC01E23),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              width: 40,
                                              height: 30,
                                              child: const Center(
                                                child: Text(
                                                  '1',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                          leading: Image.asset(_item['icone'],
                                              color:
                                                  (controller.selectedIndex ==
                                                          index)
                                                      ? AppColors.green
                                                      : Colors.white),
                                          onTap: () {
                                            controller.selectedIndex = index;
                                            Get.offNamed(_item['rota']);
                                          },
                                          selected: controller.selectedIndex ==
                                              index),
                                    ),
                                  ),
                                ),
                              );
                            } else if (_item['rota'] == Routes.following) {
                              return Obx(
                                () => Container(
                                  decoration:
                                      (controller.selectedIndex == index)
                                          ? const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                                bottom: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                              ),
                                            )
                                          : null,
                                  child: Obx(
                                    () => Card(
                                      color: const Color(0XFF007E94),
                                      elevation: 3,
                                      child: ListTile(
                                          title: Text(
                                            _item['titulo'],
                                            style: TextStyle(
                                                color:
                                                    (controller.selectedIndex ==
                                                            index)
                                                        ? AppColors.green
                                                        : Colors.white,
                                                fontSize: 19),
                                          ),
                                          leading: Image.asset(_item['icone'],
                                              color:
                                                  (controller.selectedIndex ==
                                                          index)
                                                      ? AppColors.green
                                                      : Colors.white),
                                          onTap: () {
                                            controller.selectedIndex = index;
                                            Get.offNamed(_item['rota']);
                                          },
                                          selected: controller.selectedIndex ==
                                              index),
                                    ),
                                  ),
                                ),
                              );
                            } else if (_item['rota'] == Routes.favoriteds) {
                              return Obx(
                                () => Container(
                                  decoration:
                                      (controller.selectedIndex == index)
                                          ? const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                                bottom: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                              ),
                                            )
                                          : null,
                                  child: Obx(
                                    () => Card(
                                      color: const Color(0XFF007E94),
                                      elevation: 3,
                                      child: ListTile(
                                          title: Text(
                                            _item['titulo'],
                                            style: TextStyle(
                                                color:
                                                    (controller.selectedIndex ==
                                                            index)
                                                        ? AppColors.green
                                                        : Colors.white,
                                                fontSize: 19),
                                          ),
                                          leading: Image.asset(_item['icone'],
                                              color:
                                                  (controller.selectedIndex ==
                                                          index)
                                                      ? AppColors.green
                                                      : Colors.white),
                                          onTap: () {
                                            controller.selectedIndex = index;
                                            Get.offNamed(_item['rota']);
                                          },
                                          selected: controller.selectedIndex ==
                                              index),
                                    ),
                                  ),
                                ),
                              );
                            } else if (_item['rota'] == Routes.net) {
                              return Obx(
                                () => Container(
                                  decoration:
                                      (controller.selectedIndex == index)
                                          ? const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                                bottom: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                              ),
                                            )
                                          : null,
                                  child: Obx(
                                    () => Card(
                                      color: const Color(0XFF007E94),
                                      elevation: 3,
                                      child: ListTile(
                                          title: Text(
                                            _item['titulo'],
                                            style: TextStyle(
                                                color:
                                                    (controller.selectedIndex ==
                                                            index)
                                                        ? AppColors.green
                                                        : Colors.white,
                                                fontSize: 19),
                                          ),
                                          leading: Image.asset(_item['icone'],
                                              color:
                                                  (controller.selectedIndex ==
                                                          index)
                                                      ? AppColors.green
                                                      : Colors.white),
                                          onTap: () {
                                            controller.selectedIndex = index;
                                            Get.offNamed(_item['rota']);
                                          },
                                          selected: controller.selectedIndex ==
                                              index),
                                    ),
                                  ),
                                ),
                              );
                            } else if (_item['rota'] == Routes.configuration) {
                              return Obx(
                                () => Container(
                                  decoration:
                                      (controller.selectedIndex == index)
                                          ? const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                                bottom: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                              ),
                                            )
                                          : null,
                                  child: Obx(
                                    () => Card(
                                      color: const Color(0XFF007E94),
                                      elevation: 3,
                                      child: ListTile(
                                          title: Text(
                                            _item['titulo'],
                                            style: TextStyle(
                                                color:
                                                    (controller.selectedIndex ==
                                                            index)
                                                        ? AppColors.green
                                                        : Colors.white,
                                                fontSize: 19),
                                          ),
                                          leading: Image.asset(_item['icone'],
                                              color:
                                                  (controller.selectedIndex ==
                                                          index)
                                                      ? AppColors.green
                                                      : Colors.white),
                                          onTap: () {
                                            controller.selectedIndex = index;
                                            Get.offNamed(_item['rota']);
                                          },
                                          selected: controller.selectedIndex ==
                                              index),
                                    ),
                                  ),
                                ),
                              );
                            } else if (_item['rota'] == Routes.mmn) {
                              return Obx(
                                () => Container(
                                  decoration:
                                      (controller.selectedIndex == index)
                                          ? const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                                bottom: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                              ),
                                            )
                                          : null,
                                  child: Obx(
                                    () => Card(
                                      color: const Color(0XFF007E94),
                                      elevation: 3,
                                      child: ListTile(
                                          title: Text(
                                            _item['titulo'],
                                            style: TextStyle(
                                                color:
                                                    (controller.selectedIndex ==
                                                            index)
                                                        ? AppColors.green
                                                        : Colors.white,
                                                fontSize: 19),
                                          ),
                                          leading: Image.asset(_item['icone'],
                                              color:
                                                  (controller.selectedIndex ==
                                                          index)
                                                      ? AppColors.green
                                                      : Colors.white),
                                          onTap: () {
                                            controller.selectedIndex = index;
                                            Get.offNamed(_item['rota']);
                                          },
                                          selected: controller.selectedIndex ==
                                              index),
                                    ),
                                  ),
                                ),
                              );
                            } else if (_item['titulo'] == 'Sair') {
                              return Obx(
                                () => Container(
                                  decoration:
                                      (controller.selectedIndex == index)
                                          ? const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                                bottom: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.white),
                                              ),
                                            )
                                          : null,
                                  child: Obx(
                                    () => Card(
                                      color: const Color(0XFF007E94),
                                      elevation: 3,
                                      child: ListTile(
                                        title: Text(
                                          _item['titulo'],
                                          style: TextStyle(
                                              color:
                                                  (controller.selectedIndex ==
                                                          index)
                                                      ? AppColors.green
                                                      : Colors.white,
                                              fontSize: 19),
                                        ),
                                        leading: Image.asset(_item['icone'],
                                            color: (controller.selectedIndex ==
                                                    index)
                                                ? AppColors.green
                                                : Colors.white),
                                        onTap: () {
                                          controller.selectedIndex = index;
                                          showCupertinoDialog(
                                            context: context,
                                            builder: (_) {
                                              return const QuitDialog();
                                            },
                                          );
                                        },
                                        selected:
                                            controller.selectedIndex == index,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        )
      ],
    );
  }
}
