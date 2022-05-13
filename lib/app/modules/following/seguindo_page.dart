
import 'package:azerox/app/modules/publishers/editores_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeguindoPage extends GetView<EditoresController> {
  const SeguindoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seguindo'),
      ),
    );
  }
}
