import 'package:azerox/app/modules/initial/initial_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_images.dart';
import '../../config/app_routes.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with TickerProviderStateMixin {
  TabController? tabController;
  PageController? pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();

    tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                height: MediaQuery.of(context).size.height * 0.47,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: (page) {
                          tabController!.index = page;
                        },
                        allowImplicitScrolling: true,
                        controller: pageController,
                        children: [
                          Image.asset(AppImages.azerox1),
                          Image.asset(AppImages.azerox2),
                          Image.asset(AppImages.azerox3),
                          Center(
                            child: Image.asset(
                              AppImages.azerox4,
                              width: MediaQuery.of(context).size.width * 0.73,
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              TabPageSelector(
                controller: tabController,
                indicatorSize: 13,
                color: Colors.white,
              ),
              const SizedBox(height: 25),
              Column(
                children: [
                  GestureDetector(
                    child: Image.asset(AppImages.login_instagram),
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    child: Image.asset(AppImages.login_google),
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    child: Image.asset(AppImages.login_facebook),
                    onTap: () async{
                      final controller = Get.find<InitialController>();
                      await controller.loginWithFacebook();
                    },
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    child: Image.asset(AppImages.login_email),
                    onTap: () => Get.offNamed(Routes.login),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
