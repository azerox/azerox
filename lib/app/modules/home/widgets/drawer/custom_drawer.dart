import 'package:azerox/app/models/user.dart';
import 'package:azerox/app/modules/home/home_controller.dart';
import 'package:azerox/app/modules/home/repositories/home_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/editor_model.dart';
import '../card_info_widget.dart';
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
                      icon:
                          const Icon(Icons.close, color: Colors.black, size: 10),
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
                child: FutureBuilder<List<UserModel>>(
                  future: controller.searchByUser(),
                  builder: (context, snapshot) {
                    final List<UserModel> editores = snapshot.data ?? [];

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CupertinoActivityIndicator());
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: editores.length,
                      itemBuilder: (context, index) {
                        return CardInfoWidget(
                          showNet: false,
                          showEdit: false,
                          color: const Color(0XFF005E6C),
                          editor: editores[index],
                          isShearch: true,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
