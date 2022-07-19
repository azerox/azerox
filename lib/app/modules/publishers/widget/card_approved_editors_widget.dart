import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/config/app_constants.dart';
import 'package:azerox/app/models/new_editor.dart';
import 'package:azerox/app/modules/home/widgets/image_profile_widget.dart';
import 'package:azerox/app/modules/publishers/controllers/chapters_Publisher_controller.dart';
import 'package:azerox/app/modules/publishers/controllers/editores_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_images.dart';
import '../../../config/app_routes.dart';
import '../../../models/post.dart';


typedef AddCommentCallback = void Function(Post comment);

class CardApprovedEditorsWidget extends StatelessWidget {
  final NewEditor newEditor;
  final bool showNet;
  final bool showEdit;
  final Color color;
  final bool isShearch;
  final AddCommentCallback? onAddCommentCallback;
  final ChaptersPublisherController? bottomsheetController;

  const CardApprovedEditorsWidget({
    Key? key,
    required this.newEditor,
    this.showNet = true,
    this.showEdit = false,
    this.color = AppColors.primary,
    this.isShearch = false,
    this.onAddCommentCallback,
    this.bottomsheetController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //  int? currentIndex;
   // final homeController = Get.find<EditoresController>();
    final appController = Get.find<AppController>();

    bool isPostOwner =
        appController.currentUser.value.codUser == newEditor.user!.codUser;

    final dateFormated = DateFormat('dd/MM/yyyy')
        .format(DateTime.parse(newEditor.user!.birthString ?? '00000000'));

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
            Wrap(
              spacing: 5.0,
              runSpacing: 5.0,
              direction: Axis.vertical, // main axis (rows or columns)
              children: <Widget>[
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        height: 60,
                        width: 58,
                        fit: BoxFit.cover,
                        imageUrl: newEditor.user!.filePicture,
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
                            newEditor.user!.name,
                            style: const TextStyle(color: Colors.white),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                        Visibility(
                          visible: newEditor.user!.nick != null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                newEditor.user!.nick ?? '',
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
                          visible: newEditor.user!.city != null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '${newEditor.user!.city} - ${AppConstants.uf[newEditor.user!.state]}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(width: 5),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: newEditor.user!.birthString != null,
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
                                visible: newEditor.user!.country == 'Brasil' ||
                                    newEditor.user!.country != null,
                                child: Image.asset(AppImages.br),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 5),
                    Visibility(
                      visible: isShearch,
                      child: SizedBox(
                        height: 25,
                        child: ElevatedButton(
                          child: const Text('+ Editor'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          onPressed: () {},
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
