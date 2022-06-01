import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/core/color/configuration_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AvisoModalComment extends StatefulWidget {
  const AvisoModalComment({Key? key}) : super(key: key);

  @override
  State<AvisoModalComment> createState() => _AvisoModalCommentState();
}

class _AvisoModalCommentState extends State<AvisoModalComment> {
  void openURL() async {
    const url = 'https://azerox.maxxmultinivel.com.br/cadastro';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      /// Não è possível abrir a URL
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextButton(
              onPressed: openURL,
              child: Image.asset(AppImages.aviso),
            )
          ],
        ),
      ),
    );
  }
}
