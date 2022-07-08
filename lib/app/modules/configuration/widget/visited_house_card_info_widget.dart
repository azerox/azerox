import 'package:azerox/app/config/app_constants.dart';
import 'package:azerox/app/models/user.dart';
import 'package:azerox/app/modules/configuration/widget/visited_house_modal_social_networks.dart';
import 'package:azerox/app/modules/home/widgets/image_profile_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_images.dart';

class VisitedHouseCardInfoWidget extends StatelessWidget {
  final bool showNet;
  final bool showEdit;
  final Color color;
  final UserModel editor;
  final bool isShearch;

  const VisitedHouseCardInfoWidget({
    Key? key,
    this.showNet = true,
    this.showEdit = false,
    this.color = AppColors.primary,
    required this.editor,
    this.isShearch = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormated = DateFormat('dd/MM/yyyy')
        .format(DateTime.parse(editor.birthString ?? '00000000'));

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    height: 60,
                    width: 58,
                    fit: BoxFit.cover,
                    imageUrl: editor.filePicture,
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
                      width: 130,
                      child: Text(
                        editor.name,
                        style: const TextStyle(color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ),
                    Visibility(
                      visible: editor.nick != null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            editor.nick ?? '',
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
                      visible: editor.city != null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${editor.city} - ${AppConstants.uf[editor.state]}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: editor.birthString != null,
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
                            visible: editor.country == 'Brasil' ||
                                editor.country != null,
                            child: Image.asset(AppImages.br),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "invisible_space_tex",
                      style: TextStyle(
                        color: const Color(0XFF005E6C),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Image.asset(AppImages.net),
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32),
                              ),
                            ),
                            context: context,
                            builder: (context) => const VisitedHouseModalSocialNetworks());
                      },
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
