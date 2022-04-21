import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Politics extends StatelessWidget {
  const Politics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: Get.back, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Politicas de privacidade'),
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
                      '1-  POLÍTICA DE PRIVACIDADE ',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,

                      )
                  ),
                ),
                Text(
                  'O AZEROX faz uso da mais alta e adequada tecnologia disponível no mercado para garantir a segurança e a proteção de seus dados contra o acesso de pessoas não autorizadas ou o uso inadequado.'
                      'A senha utilizada pelo usuário para o seu acesso à sua conta é confidencial e criptografada, o que garante o sigilo e a segurança das informações. É importante que o usuário evite escolher senhas'
                      'simples, como telefones e datas de aniversário, dificultando-se, assim, a utilização não autorizada por terceiros mal intencionados.'
                      'Caso o AZEROX identifique que o conteúdo utilizado pelo usuário conflita com os termos previstos neste instrumento, terá direito de excluir o perfil do usuário.'
                      'Poderá também o AZEROX editar ou alterar o perfil do usuário e, em casos mais graves, excluí-los, quando identificar a utilização de linguagem ofensiva ou que faça apologia a práticas ilegais/crimes'
                      'ou que atentem contra a lei, a moral ou aos bons costumes. '
                      'Caso o AZEROX venha a ser processado em virtude de ato cometido por seus usuários, ser-lhe-á garantido o direito de regresso em face do causador do dano.'
                        ,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                    '2 - COOKIES',
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )
                ),
                SizedBox(height: 20),
                Text(
                  'Fica permitido, pelo presente instrumento, que o AZEROX envie cookies aos seus usuários visando o oferecimento de serviço de melhor qualidade e mais personalizado.'
                      'Os cookies são arquivos criados na máquina do usuário em que o site utiliza para fazer anotações. Esses dados podem ser utilizados para criar páginas customizadas. O usuário poderá aceitar os'
                      ' cookies ou rejeitá-los.'
                      'Optando o usuário por rejeitar todos os cookies em seu navegador, não conseguirá utilizar todos os recursos e serviços oferecidos pelo AZEROX.'
                      'Os anunciantes ou outras empresas não terão acesso aos cookies do AZEROX.'
                  ,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                    '3 - DAS OBRIGAÇÕES DO USUÁRIO',
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )
                ),
                SizedBox(height: 20),
                Text(
                  'O usuário responsabiliza-se pela titularidade das informações pessoais que transmite ao AZEROX, sendo certo que o site não se responsabiliza pela veracidade das informações prestadas por seus usuários. '
                      'O fornecimento de informações falsas configura o crime de falsidade ideológica, tipificado no art. 299 do Código Penal, de forma que, constatando o AZEROX a falsidade nas informações prestadas, '
                      'poderá excluir o usuário do site, sem prévia comunicação, até que, se for o caso, a situação reste esclarecida.'
                      'É de inteira responsabilidade do usuário providenciar o seu próprio acesso à internet e pagar todas as taxas de serviço eventualmente cobradas por terceiros com relação a tal acesso; providenciar seu '
                      'próprio acesso a um endereço para envio de mensagens eletrônicas via internet e pagar todas as taxas de serviço eventualmente cobradas por terceiros com relação a tal acesso; providenciar todo o '
                      'equipamento necessário para efetuar sua conexão à internet, incluindo, mas não se limitando, a um computador e um modem; efetuar seu próprio cadastro no AZEROX, responsabilizando-se pela '
                      'correção e veracidade dos dados informados, assim como pela guarda de sua senha de acesso; e, manter o ambiente de seu computador seguro, com uso de ferramentas disponíveis como antivírus e '
                      'firewall, entre outras, atualizadas, de modo a contribuir na prevenção de riscos eletrônicos do lado do usuário.'
                      ''
                  ,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                    '4 - DOS LINKS',
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )
                ),
                SizedBox(height: 20),
                Text(
                  'O AZEROX poderá conter ícone de acesso a outros endereços eletrônicos que sejam seus parceiros e/ou afiliados ou recursos na internet. Saindo o usuário das páginas do AZEROX e ingressando em '
                      'outro site, a relação jurídica dali decorrente não inclui o AZEROX, alcançando somente o usuário e o site acessado. '
                      'Assim, o AZEROX jamais será responsável pelo acesso a links nele indicados, bem como por atos praticados por usuários que tenham por base informações obtidas nos referidos links. Não há '
                      'responsabilidade do AZEROX nem pelas políticas/práticas de privacidade dos Portais que apontam para o site AZEROX nem para os quais o AZEROX aponta. '
                      ''
                  ,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: 20),
                Text(
                    '5 - EXCLUSÃO DE GARANTIAS E DE RESPONSABILIDADE',
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )
                ),
                SizedBox(height: 20),
                Text(
                  'Em decorrência de questões operacionais, o AZEROX e seus serviços estão sujeitos a eventuais problemas de interrupção, falha técnica, ou indisponibilidade de funcionamento temporário. O AZEROX '
                      'se exime, integralmente, de qualquer responsabilidade pelos danos e prejuízos de qualquer natureza que possam decorrer da falta de disponibilidade ou de continuidade do funcionamento do site e dos '
                      'serviços por ele disponibilizados. '
                  ,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                    '6 - DISPOSIÇÕES GERAIS',
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )
                ),
                SizedBox(height: 20),
                Text(
                  'A tolerância de eventual descumprimento de quaisquer das cláusulas e condições do presente Termo de Uso não constituirá novação das obrigações aqui estipuladas e tampouco impedirá ou inibirá a '
                      'exigibilidade das mesmas. O presente instrumento constitui o acordo integral entre as partes, prevalecendo sobre qualquer outro entendimento firmado anteriormente. '
                  ,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                    '7 - LEGISLAÇÃO',
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )
                ),
                SizedBox(height: 20),
                Text(
                  'O presente Termo de Uso é regido pela legislação da República Federativa do Brasil. Seu texto deverá ser interpretado no idioma português.'
                  ,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                    '8 - DO FORO DE ELEIÇÃO',
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )
                ),
                SizedBox(height: 20),
                Text(
                  'Fica eleito o foro da Capital do Estado do Rio de Janeiro para dirimir eventuais dúvidas relacionadas ao presente instrumento. '
                      'AFIRMO QUE LI O INTEIRO TEOR E COMPREENDI OS TERMOS E DISPOSIÇÕES DESTE TERMO DE USO, ESTANDO DE ACORDO COM TODAS AS SUAS CONDIÇÕES. '
                      ''
                  ,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ]
          )
        ),
      ),
    );
  }
}
