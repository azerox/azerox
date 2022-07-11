import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/models/social_networks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialNetworksWidget extends StatefulWidget {
  final SocialNetworks redeSocial;

  const SocialNetworksWidget({required this.redeSocial, Key? key})
      : super(key: key);

  @override
  State<SocialNetworksWidget> createState() => _SocialNetworksWidgetState();
}

class _SocialNetworksWidgetState extends State<SocialNetworksWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 6.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.redeSocial.network.toString() == 'Facebook')
                    Image.asset(
                      AppImages.facebook,
                    ),
                  if (widget.redeSocial.network.toString() == 'Site')
                    Image.asset(
                      AppImages.net2,
                    ),
                  if (widget.redeSocial.network.toString() == 'Twitter')
                    Image.asset(
                      AppImages.twitter,
                    ),
                  if (widget.redeSocial.network.toString() == 'Youtube')
                    Image.asset(
                      AppImages.youtube,
                    ),
                  if (widget.redeSocial.network.toString() == 'Flickr')
                    Image.asset(
                      AppImages.flickr,
                    ),
                  if (widget.redeSocial.network.toString() == 'Linkedin')
                    Image.asset(
                      AppImages.linkedin,
                    ),
                  if (widget.redeSocial.network.toString() == 'Instagram')
                    Image.asset(
                      AppImages.instagram,
                    ),
                  if (widget.redeSocial.network.toString() == 'Pintrest')
                    Image.asset(
                      AppImages.pinterest,
                    ),
                  if (widget.redeSocial.network.toString() == 'Pnera')
                    Image.asset(
                      AppImages.snapchat,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
