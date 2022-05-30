import 'package:azerox/app/config/app_colors.dart';
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

  void openURL() async{
    const url = 'https://azerox.maxxmultinivel.com.br/cadastro';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      /// Não è possível abrir a URL
    }
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.60,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Form(
              child: Card(
                elevation: 3,
            color: HexColor("c6e3e9"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: FloatingActionButton(
                    onPressed: () => Get.back(),
                    child: const Icon(Icons.close),
                    mini: true,
                    backgroundColor: AppColors.primary,
                  ),
                ),
                Text(
                  "Aviso",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.26,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'O Azero fornece 10 capítulos Grátis para você contar sua história!'
                          'O número no aviso indica a quantidade de capítulos que você ainda tem direito.'
                          'Mas a sua história merece ser sem limite!',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Faça uma assinatura, registre infinitos capítulos e passe a fazer comentários também com áudios ilimitados.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 6),
                      Center(
                        child: Text(
                          'E muito barato',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: HexColor("03acf1"),
                  child: FlatButton(
                      onPressed: openURL,
                      textColor: Colors.white,
                      child: Text(
                          "Assinar",
                        style: TextStyle(fontSize: 16),
                      )
                  ),
                ),

              ],
            ),
          )),
        ),
      ),
    );
  }

}
