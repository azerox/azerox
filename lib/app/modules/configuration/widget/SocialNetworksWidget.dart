import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/models/social_networks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialNetworksWidget extends StatefulWidget {
  final SocialNetworks redeSocial;
  final List<SocialNetworks>? lista;

  const SocialNetworksWidget({required this.redeSocial, this.lista, Key? key})
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                    visible: true,
                    child: Text("sadjbkdsbkjbkjsandkjn")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
