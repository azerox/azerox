import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/models/social_networks.dart';
import 'package:azerox/app/modules/configuration/visited_house_controller.dart';
import 'package:azerox/app/modules/configuration/widget/SocialNetworksWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class VisitedHouseModalSocialNetworks extends StatefulWidget {
  const VisitedHouseModalSocialNetworks({Key? key}) : super(key: key);

  @override
  State<VisitedHouseModalSocialNetworks> createState() =>
      _VisitedHouseModalSocialNetworksState();
}

class _VisitedHouseModalSocialNetworksState
    extends State<VisitedHouseModalSocialNetworks> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VisitedHouseController>();
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.80,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Net",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: FutureBuilder<List<SocialNetworks>>(
                  future: controller.findSocialNetworks(),
                  builder: (context, snapshot) {
                    final List<SocialNetworks> redeSociais =
                        snapshot.data ?? [];

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CupertinoActivityIndicator());
                    }

                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 3 / 2),
                        itemCount: 0,
                        itemBuilder: (context, index) {
                          return SocialNetworksWidget(
                            redeSocial: redeSociais[index],
                            lista: redeSociais,
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
