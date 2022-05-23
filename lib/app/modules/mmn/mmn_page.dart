
import 'package:azerox/app/modules/mmn/mmn_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MMNPage extends GetView<MMNController> {
  const MMNPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MMN'),
      ),
    );
  }
}
