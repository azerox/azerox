import 'package:azerox/app/config/app_images.dart';
import 'package:azerox/app/config/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';
import 'widgets/login_error_dialog.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text(
                'Fechar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
              ),
            ),
            const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
              ),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await controller.loginWithEmail(
                    controller.emailEC.text,
                    controller.passwordEC.text,
                  );
                } catch (error) {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return LoginErrorDialog(error: '$error');
                    },
                  );
                }
              },
              child: const Text(
                'Ok',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(child: CupertinoActivityIndicator())
            : Form(
                key: controller.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.emailEC,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: 'Email',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.emailEC.clear();
                            },
                            child: Image.asset(AppImages.close),
                          ),
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: controller.passwordEC,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: 'Senha',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.passwordEC.clear();
                            },
                            child: Image.asset(AppImages.close),
                          ),
                        ),
                      ),
                      const SizedBox(height: 21),
                      SizedBox(
                        width: 243,
                        height: 37,
                        child: ElevatedButton(
                          child: const Text('Novo Cadastro'),
                          onPressed: () => Get.toNamed(Routes.cadastro_email),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 243,
                        height: 37,
                        child: ElevatedButton(
                          child: const Text('Esqueci a senha'),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
