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
        padding:const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("escrevendo texto")
          ],
        ),
      ),
    );
  }
}
