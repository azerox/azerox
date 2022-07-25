import 'package:azerox/app/config/app_constants.dart';
import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/models/new_editor.dart';
import 'package:azerox/app/modules/publishers/controllers/chapter_bottomsheet_editor_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ModalEditorExclusion extends StatelessWidget {
  final NewEditor? editor;
  final ChapterBottomsheetEditorController? bottomsheetController;

  const ModalEditorExclusion({
    Key? key,
    required this.editor,
    this.bottomsheetController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =
        bottomsheetController ?? Get.find<ChapterBottomsheetEditorController>();
    final dateFormated = DateFormat('dd/MM/yyyy')
        .format(DateTime.parse(editor!.user!.birthString ?? '00000000'));

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
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 50),
              child: Container(
                  child: Column(
                children: [
                  Text(
                    'Editor Selecionado',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 15),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            height: 60,
                            width: 58,
                            fit: BoxFit.cover,
                            imageUrl: editor!.user!.filePicture,
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
                                editor!.user!.name,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: const Color(0XFF005E6C),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                            ),
                            Visibility(
                              visible: editor!.user!.nick != null,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    editor!.user!.nick ?? '',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0XFF005E6C),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(width: 5),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: editor!.user!.city != null,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${editor!.user!.city} - ${AppConstants.uf[editor!.user!.state]}',
                                    style: const TextStyle(
                                      color: const Color(0XFF005E6C),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: editor!.user!.birthString != null,
                              child: Row(
                                children: [
                                  Image.asset(AppImages.signo),
                                  const SizedBox(width: 5),
                                  Text(
                                    dateFormated,
                                    style: const TextStyle(
                                      color: const Color(0XFF005E6C),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Visibility(
                                    visible:
                                        editor!.user!.country == 'Brasil' ||
                                            editor!.user!.country != null,
                                    child: Image.asset(AppImages.br),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  controller.onRemoveEditorItemButtonPressed(
                      context, editor!.codUserFriend!, 4);
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
                          'Excluir',
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
