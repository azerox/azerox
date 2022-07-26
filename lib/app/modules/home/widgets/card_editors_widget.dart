import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/config/app_constants.dart';
import 'package:azerox/app/models/new_editor.dart';
import 'package:azerox/app/models/user.dart';
import 'package:azerox/app/modules/home/controllers/post_chapters_controller.dart';
import 'package:azerox/app/modules/home/controllers/user_chapters_controller.dart';
import 'package:azerox/app/modules/publishers/controllers/chapter_bottomsheet_editor_controller.dart';
import 'package:azerox/app/modules/publishers/widget/modal_editor_exclusion.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_images.dart';

typedef AddCommentCallback = void Function(UserModel comment);

class CardEditorsWidget extends StatelessWidget {
  final UserModel userModel;
  final bool showNet;
  final bool showEdit;
  final Color color;
  final bool isShearch;
  final AddCommentCallback? onAddCommentCallback;
  final PostChaptersController? bottomsheetController;

  const CardEditorsWidget({
    Key? key,
    required this.userModel,
    this.showNet = true,
    this.showEdit = false,
    this.color = AppColors.primary,
    this.isShearch = false,
    this.onAddCommentCallback,
    this.bottomsheetController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();

    bool isPostOwner =
        appController.currentUser.value.codUser == userModel.codUser;

    final dateFormated = DateFormat('dd/MM/yyyy')
        .format(DateTime.parse(userModel.birthString ?? '00000000'));

    return Card(
      color: Colors.grey,
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: 95,
        color: color,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        height: 60,
                        width: 58,
                        fit: BoxFit.cover,
                        imageUrl: userModel.filePicture,
                        placeholder: (context, url) {
                          return const CupertinoActivityIndicator();
                        },
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 95,
                          child: Text(
                            userModel.name,
                            style: const TextStyle(color: Colors.white),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                        Visibility(
                          visible: userModel.nick != null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                userModel.nick ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(width: 5),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: userModel.city != null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '${userModel.city} - ${AppConstants.uf[userModel.state]}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(width: 5),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: userModel.birthString != null,
                          child: Row(
                            children: [
                              Image.asset(AppImages.signo),
                              const SizedBox(width: 5),
                              Text(
                                dateFormated,
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(width: 5),
                              Visibility(
                                visible: userModel.country == 'Brasil' ||
                                    userModel.country != null,
                                child: Image.asset(AppImages.br),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Center(
                        child: Visibility(
                          visible: isShearch,
                          child: SizedBox(
                            height: 25,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                  'Editor',
                                style: TextStyle(
                                  color: Colors.blue
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
