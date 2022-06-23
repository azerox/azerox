import 'package:azerox/app/config/app_images.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SpecificAvisoModalComment extends StatefulWidget {
  const SpecificAvisoModalComment({Key? key}) : super(key: key);

  @override
  State<SpecificAvisoModalComment> createState() => _SpecificAvisoModalCommentState();
}

class _SpecificAvisoModalCommentState extends State<SpecificAvisoModalComment> {
  void openURL() async {
    const url = 'https://azerox.maxxmultinivel.com.br/cadastro';
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding:const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
