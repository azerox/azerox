import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsentientTerms extends StatelessWidget {
  const ConsentientTerms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: Get.back, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Termos de consentimento'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(
            children: const [
              Center(
                  heightFactor: 2,
                  child: Text(
                      '1-TERMO DE CONSENTIMENTO PARA TRATAMENTO DE DADOS',

                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,

                      )
                  ),
              ),
              SizedBox(height: 20),
              Text(
                ' O Termo de Consentimento para Tratamento de Dados expressa concordância e pressupõe o conhecimento das práticas estipuladas na Política de Privacidade. '
                    'A concordância com o termo permitirá que o Azerox mantenha a privacidade dos seus dados e continue assegurando os benefícios do desenvolvimento de novas formas de tratamento, melhoria da '
                    'qualidade do serviço e garantia da segurança, que dependem do uso e tratamento dos seus dados. Seu consentimento para que a Azerox obtenha e use seus dados pessoais para os seguintes fins: '
                    ''
                ,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 1),
              Text(
                'Será necessário obter: '
                ,style: TextStyle(
                color: Colors.black,
              ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 3),
              Text(
                'Dados Pessoais '
                ,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 3),
              Text(
                'Nome e sobrenome; '
                ,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 3),
              Text(
                'Sexo;'
                ,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 3),
              Text(
                'Nacionalidade;'
                ,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 3),
              Text(
                ' Data de nascimento;'
                ,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 3),
              Text(
                'CPF;'
                ,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 3),
              Text(
                'RG;'
                ,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 3),
              Text(
                'E-mail;'
                ,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 3),
              Text(
                'Nº Celular;'
                ,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 3),
              Text(
                'Nº Telefone;'
                ,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 3),
              Text(
                'Dados Cadastrais'
                ,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 3),
              Text(
                'Endereço completo;'
                ,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              Text(
                  '2-Finalidades:',
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )
              ),
              SizedBox(height: 20),
              SizedBox(height: 3),
              Text(
                'Cadastrar e dispor das soluções disponíveis no sistema;'
                ,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 3),
              Text(
                'Compartilhar os dados com outros usuários da rede AZEROX;'
                ,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 3),
              Text(
                'Compartilhar os dados com terceiros que fazem o armazenamento e tratamento dos dados coletados;'
                ,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 3),
              Text(
                ' Envio de propagandas de marketing através do e-mail, Celular e Telefone.'
                ,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
