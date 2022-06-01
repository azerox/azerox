
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
        title: Text('Net'),
      ),
    );
  }
}
