import 'package:azerox/app/app_controller.dart';
import 'package:azerox/app/models/editor_model.dart';
import 'package:azerox/app/modules/home/controllers/chapter_bottomsheet_controller.dart';
import 'package:azerox/app/modules/home/home_controller.dart';
import 'package:azerox/app/modules/home/widgets/post_button.dart';
import 'package:azerox/app/modules/home/widgets/post_item_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_images.dart';




class SocialNetworkWidget extends StatelessWidget {
  final EditorModel editor;



  const SocialNetworkWidget({
    Key? key,
    required this.editor,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final dateFormated = DateFormat('dd/MM/yyyy')
        .format(DateTime.parse(editor.editor.birthString ?? '00000000'));

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: editor.editor.country != null,
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
                  visible: editor.editor.country == 'Brasil' ||
                      editor.editor.country != null,
                  child: Image.asset(AppImages.br),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
