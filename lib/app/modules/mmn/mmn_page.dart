import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/config/app_routes.dart';
import 'package:azerox/app/core/color/configuration_color.dart';
import 'package:azerox/app/modules/home/widgets/drawer/drawer_content_widget.dart';
import 'package:azerox/app/modules/mmn/mmn_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MMNPage extends GetView<MMNController> {
  const MMNPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void openURL() async {
      const url = 'https://azerox.maxxmultinivel.com.br/cadastro';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        /// Não è possível abrir a URL
      }
    }
    DrawerContentWidget drawerContentWidget = DrawerContentWidget();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed(Routes.home);
              drawerContentWidget.controller.selectedIndex = 0;
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('MMN'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: Container(
                      child: Form(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                    "Faça Parte",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                 Container(
                   width: MediaQuery.of(context).size.width,
                   height: 600,
                    child: Image.asset(
                        AppImages.mmn1,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
