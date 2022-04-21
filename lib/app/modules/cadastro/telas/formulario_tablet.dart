import 'package:flutter/material.dart';

class FormularioUserTablet extends StatefulWidget {
  const FormularioUserTablet({Key? key}) : super(key: key);

  @override
  State<FormularioUserTablet> createState() => _FormularioUserTabletState();
}

class _FormularioUserTabletState extends State<FormularioUserTablet> {
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
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
