import 'package:azerox/app/config/app_colors.dart';
import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/core/color/configuration_color.dart';
import 'package:azerox/app/modules/home/widgets/drawer/custom_drawer.dart';
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

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: Image.asset(AppImages.logo),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Form(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              elevation: 4,
                              color: HexColor("03acf1"),
                              child: SizedBox(
                                width: 243,
                                height: 37,
                                child: ElevatedButton(
                                  child: const Text('Faça seu Cadastro'),
                                  onPressed: openURL,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    SizedBox(
                    child: Image.asset(AppImages.mmn1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
