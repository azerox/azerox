import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/models/social_networks.dart';
import 'package:azerox/app/modules/configuration/visited_house_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialNetworksWidget extends StatefulWidget {
  final SocialNetworks redeSocial;
  final List<SocialNetworks>? lista;

  const SocialNetworksWidget({required this.redeSocial, this.lista, Key? key})
      : super(key: key);

  @override
  State<SocialNetworksWidget> createState() => _SocialNetworksWidgetState();
}

class _SocialNetworksWidgetState extends State<SocialNetworksWidget> {
  openURL(String url) async {
    // Esse é o método que direciona para a página
    return await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VisitedHouseController>();
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () =>
                          openURL(widget.redeSocial.userNetWorkUrl.toString()),
                      child: Visibility(
                        visible: widget.redeSocial.network.toString() == 'Site',
                        child: Image.asset(
                          AppImages.net2,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          openURL(widget.redeSocial.userNetWorkUrl.toString()),
                      child: Visibility(
                        visible:
                            widget.redeSocial.network.toString() == 'Youtube',
                        child: Image.asset(
                          AppImages.youtube,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          openURL(widget.redeSocial.userNetWorkUrl.toString()),
                      child: Visibility(
                        visible: widget.redeSocial.network.toString() == 'Map',
                        child: Image.asset(
                          AppImages.snapchat,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          openURL(widget.redeSocial.userNetWorkUrl.toString()),
                      child: Visibility(
                        visible:
                            widget.redeSocial.network.toString() == 'Facebook',
                        child: Image.asset(
                          AppImages.facebook,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          openURL(widget.redeSocial.userNetWorkUrl.toString()),
                      child: Visibility(
                        visible:
                            widget.redeSocial.network.toString() == 'Twitter',
                        child: Image.asset(
                          AppImages.twitter,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          openURL(widget.redeSocial.userNetWorkUrl.toString()),
                      child: Visibility(
                        visible:
                            widget.redeSocial.network.toString() == 'Flickr',
                        child: Image.asset(
                          AppImages.flickr,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          openURL(widget.redeSocial.userNetWorkUrl.toString()),
                      child: Visibility(
                        visible:
                            widget.redeSocial.network.toString() == 'Linkedin',
                        child: Image.asset(
                          AppImages.linkedin,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          openURL(widget.redeSocial.userNetWorkUrl.toString()),
                      child: Visibility(
                        visible:
                            widget.redeSocial.network.toString() == 'Instagram',
                        child: Image.asset(
                          AppImages.instagram,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          openURL(widget.redeSocial.userNetWorkUrl.toString()),
                      child: Visibility(
                        visible:
                            widget.redeSocial.network.toString() == 'Pintrest',
                        child: Image.asset(
                          AppImages.pinterest,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
