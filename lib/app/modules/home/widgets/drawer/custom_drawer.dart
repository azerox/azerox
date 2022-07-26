import 'package:azerox/app/models/user.dart';
import 'package:azerox/app/modules/home/controllers/user_chapters_controller.dart';
import 'package:azerox/app/modules/home/home_controller.dart';
import 'package:azerox/app/modules/home/widgets/card_editors_widget.dart';
import 'package:azerox/app/modules/home/widgets/user_pagination_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'drawer_content_widget.dart';

class CustomDrawer extends StatefulWidget {
  final int? editores;
  final bool? showEditores;

  const CustomDrawer({
    Key? key,
    this.editores = 1,
    this.showEditores = true,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final UserChaptersController userChaptersController = GetInstance().find();
    return Container(
      width: 315,
      child: Drawer(
        backgroundColor: const Color(0XFF007E94),
        child: SafeArea(
          child: ListView(
            children: [
              Container(
                color: const Color(0XFF005E6C),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  controller: controller.searchDrawerEC,
                  onChanged: (value) {
                    setState(() {});
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Procurar novos editores',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.searchDrawerEC.clear();
                        controller.searchDrawerEC.text = "";
                        setState(() {});
                      },
                      icon: const Icon(Icons.close,
                          color: Colors.black, size: 10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Visibility(
                visible: controller.searchDrawerEC.text.length < 3,
                child: DrawerContentWidget(
                  editores: widget.editores,
                  showEditores: widget.showEditores,
                ),
              ),
              Visibility(
                visible: controller.searchDrawerEC.text.length >= 3,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: UserPaginationWidget<UserModel>(
                    controller: userChaptersController,
                    builder: (context, userModel) => CardEditorsWidget(
                      key: ValueKey(userModel.codUser),
                      userModel: userModel,
                      isShearch: true,
                      color: const Color(0XFF005E6C),
                      onAddCommentCallback:
                          userChaptersController.onAddCommentCallback,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
