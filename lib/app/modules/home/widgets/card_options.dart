import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/models/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/chapter_bottomsheet_controller.dart';

class CardOptions extends StatelessWidget {
  final Post? post;
  final bool isComment;
  final ChapterBottomsheetController? bottomsheetController;

  const CardOptions({
    Key? key,
    this.isComment = false,
    required this.post,
    this.bottomsheetController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =
        bottomsheetController ?? Get.find<ChapterBottomsheetController>();
    final bool commentIsMine = post?.user?.codUser ==
        Get.find<AppController>().currentUser.value.codUser;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 28,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 30, top: 16),
              color: const Color(0XFFC4C4C4),
              height: 6,
              width: 54,
            ),
            Visibility(
              visible: commentIsMine,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0XFFE5E5E5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.only(bottom: 24),
                  height: 94,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.edit,
                          color: Color(0XFF00ADF2),
                          size: 33,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Editar ${isComment == true ? 'coment??rio' : 'cap??tulo'}',
                          style: const TextStyle(
                            color: Color(0XFF00ADF2),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isComment == false,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  height: 94,
                  decoration: BoxDecoration(
                    color: const Color(0XFFE5E5E5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImages.fix,
                          color: const Color(0XFF00ADF2),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Fixar cap??tulo',
                          style: TextStyle(
                            color: Color(0XFF00ADF2),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  controller.onRemoveItemButtonPressed(context, post!.codPost!);
                },
                child: Container(
                  height: 94,
                  decoration: BoxDecoration(
                    color: const Color(0XFFE5E5E5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImages.delete,
                          color: const Color(0XFF00ADF2),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Excluir ${isComment == true ? 'coment??rio' : 'cap??tulo'}',
                          style: const TextStyle(
                            color: Color(0XFF00ADF2),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
