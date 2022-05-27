import 'package:azerox/app/modules/initial/initial_controller.dart';
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
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              const SizedBox(height: 50),
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
                    Image.asset(AppImages.azerox4),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              TabPageSelector(
                controller: tabController,
                indicatorSize: 13,
                color: Colors.grey,
                selectedColor: Colors.black,
              ),
              const SizedBox(height: 50),
              Expanded(
                child: Column(
                  children: [
                    GestureDetector(
                      child: Image.asset(AppImages.instaBtn),
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 309,
                      height: 47,
                      child: ElevatedButton.icon(
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Image.asset(
                            AppImages.tiktok,
                            height: 21,
                            color: Colors.white,
                          ),
                        ),
                        label: const Center(
                          child: Text(
                            'Login com Tik Tok',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 309,
                      height: 47,
                      child: ElevatedButton.icon(
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Image.asset(
                            AppImages.fb,
                            height: 21,
                            color: Colors.white,
                          ),
                        ),
                        label: const Center(
                          child: Text(
                            'Login com Facebook',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0XFF435698),
                        ),
                        onPressed: () async {
                          final controller = Get.find<InitialController>();
                          await controller.loginWithFacebook();
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 309,
                      height: 47,
                      child: ElevatedButton.icon(
                        icon: const Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Icon(Icons.email),
                        ),
                        label: const Center(
                          child: Text(
                            'Login com E-mail',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0XFF7D7D7D),
                        ),
                        onPressed: () => Get.offNamed(Routes.login),
                      ),
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
