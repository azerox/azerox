import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/models/new_editor.dart';
import 'package:azerox/app/models/paged_info_new_editor.dart';
import 'package:flutter/material.dart';

class TitleNewEditorWidgetNumber extends StatefulWidget {
  final PagedInfoNewEditor pagedInfoNewEditor;
  const TitleNewEditorWidgetNumber({
    Key? key,
    required this.pagedInfoNewEditor,
  }) : super(key: key);

  @override
  State<TitleNewEditorWidgetNumber> createState() => _TitleNewEditorWidgetNumberState();
}

class _TitleNewEditorWidgetNumberState extends State<TitleNewEditorWidgetNumber> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        children: [
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width * 1.2,
            color: AppColors.primary,
            child: Row(
              children: [
                const SizedBox(width: 10),
                Image.asset(
                  AppImages.editores,
                ),
                const SizedBox(width: 10),
                Text(
                  'Editores',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
