import 'package:flutter/material.dart';

class FormularioUserDesktop extends StatefulWidget {
  const FormularioUserDesktop({Key? key}) : super(key: key);

  @override
  State<FormularioUserDesktop> createState() => _FormularioUserDesktopState();
}

class _FormularioUserDesktopState extends State<FormularioUserDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Cadastrar",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
