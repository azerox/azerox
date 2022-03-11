import 'package:azerox/app/modules/home/home_controller.dart';
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

    return Drawer(
      backgroundColor: const Color(0XFF007E94),
      child: SafeArea(
        child: ListView(
          children: [
            Container(
              color: const Color(0XFF005E6C),
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: controller.searchDrawerEC,
                onChanged: (value) {
                  setState(() {});
                },
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Procurar Editores',
                  prefixIcon: Icon(Icons.search),
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
              child: FutureBuilder<List<EditorModel>>(
                future: controller.searchByUser(),
                builder: (context, snapshot) {
                  final List<EditorModel> editores = snapshot.data ?? [];

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
                        editor: editores[index].editor,
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
    );
  }
}
