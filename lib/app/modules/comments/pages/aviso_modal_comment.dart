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
        height: MediaQuery.of(context).size.height * 0.50,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Form(
              child: Card(
                elevation: 3,
            color: HexColor("b2ccd2"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: FloatingActionButton(
                    onPressed: () => Get.back(),
                    child: const Icon(Icons.close),
                    mini: true,
                    backgroundColor: HexColor("d72c2e"),
                  ),
                ),
                Text(
                  "Aviso",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Container(

                  margin: const EdgeInsets.all(10),
                  child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(text: 'O Azero fornece 10 capítulos Grátis para você contar sua história! '
                              'O número no aviso indica a quantidade de capítulos que você ainda tem direito. '
                              'Mas a sua história merece ser sem limite! ',
                            style: TextStyle(
                                fontSize: 13,
                              color: Colors.black
                            ),
                          ),
                          TextSpan(text: ' Faça uma assinatura, registre infinitos capítulos e passe a fazer comentários também com áudios ilimitados.',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          ),
                          TextSpan(text:  ' E muito barato',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black
                            ),
                          ),
                        ]
                      )
                  )
                ),
                Card(
                  elevation: 4,
                  color: HexColor("03acf1"),
                  child: Container(
                    width: 100,
                    height: 33,
                    child: FlatButton(
                        onPressed: openURL,
                        textColor: Colors.white,
                        child: const Text(
                            "Assinar",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                          ),
                        )
                    ),
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
