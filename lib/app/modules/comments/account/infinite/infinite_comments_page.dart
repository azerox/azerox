
import 'package:azerox/app/modules/comments/account/infinite/infinite_comments_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfiniteCommentsPage extends GetView<InfiniteCommentsController> {
  const InfiniteCommentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seguindo'),
      ),
    );
  }
}
