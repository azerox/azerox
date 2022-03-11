import 'package:azerox/app/config/app_constants.dart';
import 'package:azerox/app/models/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_images.dart';

class CardInfoWidget extends StatelessWidget {
  final bool showNet;
  final bool showEdit;
  final Color color;
  final UserModel editor;
  final bool isShearch;

  const CardInfoWidget({
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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 95,
      color: color,
      child: Stack(
        children: [
          Row(
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
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: editor.state != null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${editor.state} - ${AppConstants.uf[editor.state]}',
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
                        Text(dateFormated),
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
              Visibility(
                visible: showNet,
                child: Image.asset(AppImages.net),
              ),
            ],
          ),
          Visibility(
            visible: showEdit,
            child: Positioned(
              left: 35,
              child: GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  minRadius: 17,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
