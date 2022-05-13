
import 'package:azerox/app/modules/publishers/editores_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditoresPage extends GetView<EditoresController> {
  const EditoresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editores'),
      ),
    );
  }
}
