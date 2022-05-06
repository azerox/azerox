import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UseTerms extends StatelessWidget {
  const UseTerms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: Get.back, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Termos de uso'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(
            children: const [
              Center(
                heightFactor: 2,
                child: Text('1-TERMO DE USO',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Text(
                'O presente Termo de Uso estabelece os termos obrigacionais que '
                'irão reger a relação jurídica entre o site AZEROX e seus usuários, '
                'tratando-se de contrato eletrônico que possui eficácia e validade jurídicas'
                ', na forma do Código Civil Brasileiro (Lei 10.406/2002). Este '
                'Termo de Uso tem por finalidade assegurar a efetivação de uma '
                'política de transparência, privacidade e segurança para a '
                'administração do Aplicativo e respectivos usuários, nos termos da'
                'lei. Assim, para cadastrar-se no App AZEROX, é indispensável que '
                'o usuário leia e concorde com todas as disposições constantes neste Termo de Uso.'
                ' Por ocasião do cadastramento no site AZEROX, o usuário se obriga às condições abaixo elencadas, sendo certo que,'
                'em caso de violação das mesmas, a Administração do App AZEROX poderá, além'
                'de cancelar a conta do usuário, adotar as medidas judiciais cabíveis para salvaguarda '
                'de seus direitos, com vistas a evitar danos para si ou demais usuários. '
                'Na hipótese de cancelamento de conta por culpa do usuário, seja por violação dos'
                'Termo de Uso ou da própria lei, este não será reembolsado das quantias eventualmente despendidas. '
                'É indispensável que o usuário leia atentamente este Termo de Uso, com sua posterior aceitação, '
                'em caso de concordância com suas disposições. Após a aceitação deste Termo de Uso, as disposições'
                'ora previstas serão consideradas lidas e deverão ser obedecidas pelo usuário.',
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              Text('2 - DO SERVIÇO DISPONIBILIZADO:',
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 20),
              Text(
                'O AZEROX é um App de Autobiografias Digitais. '
                'A oferta de serviços virtuais não está sujeita a qualquer tipo de autorização prévia pelo simples fato de ser fornecida por meio eletrônico. '
                'Os serviços do AZEROX somente serão oferecidos quando o site estiver no ar e disponível para acesso. Na eventualidade de ocorrerem problemas operacionais com o site que o deixe'
                'temporariamente fora do ar, o usuário não fará jus a qualquer reembolso, pois os serviços disponibilizados ficarão suspensos. '
                'Caso o AZEROX venha a prestar novos serviços não contemplados neste instrumento, dever-se-á entendê-los como incluídos no presente Termo de Uso, incidindo, automaticamente, as regras aqui'
                'vigentes.',
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 1),
              Text(
                'O register no AZEROX deverá obedecer as seguintes regras: ',
                textAlign: TextAlign.justify,
              ),
              Text(
                '(i) PESSOA FÍSICA: O cadastramento de pessoa física é gratuito, por prazo indeterminado, dando direito à 10 Capítulos Gratuitos, podendo fazer infinitos comentários nos Capítulos de Co-Editores'
                'autorizados sem uso do áudio.'
                '(ii) PESSOA FÍSICA COM PERFIL PREMIUM: Os usuários que decidirem ter um Perfil Premium Azerox, deverão fazer uma assinatura mensal de acordo com a tabela'
                'vigente, esta taxa concede o direito de Publicar Infinitos Capítulos, e fazer infinitos comentários com o uso do áudio durante o período da assinatura, caso tenha interrupção no pagamento, será avisado'
                'e terá apresentado os 10 primeiros capítulos postados, ao retornar em até 6 meses a assinatura ainda estará armazenada todos os capítulos, após esse período o Azerox poderá excluir estes capítulos'
                'sem aviso.',
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              Text('3 - DADOS DO USUÁRIO E CONFIDENCIALIDADE',
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 20),
              Text(
                'O usuário se compromete a fornecer dados pessoais verdadeiros, precisos, atualizados e completos durante o procedimento de registro, cadastramento de seu perfil e de cobrança dos valores'
                'pactuados, bem como a manter atualizadas as informações prestadas.'
                'O AZEROX poderá fornecer estatísticas sobre compras, perfil de consumo e padrões de navegação de seus usuários a terceiros idôneos.'
                'Quando da adesão ao site, o usuário poderá fornecer, através de questionários realizados pelo AZEROX ou em conjunto com terceiros, alguns dados de natureza pessoal. Assim procedendo, garantese ao usuário estrita confidencialidade em relação aos mesmos.'
                'Todo e qualquer repasse de informação não sigilosa dos usuários a eventuais parceiros e/ou afiliados do AZEROX obedecerá ao estabelecido neste Termo de Uso. Em havendo qualquer tipo de'
                'violação ao disposto neste instrumento, responderão os responsáveis judicialmente por seus atos.'
                'O AZEROX não se responsabiliza pelas publicações veiculadas pelos usuários, sejam fotos, textos ou áudio, que responderão civil e criminalmente em caso de violação de direitos de terceiros. Todavia,'
                'sempre que julgar necessário, o AZEROX poderá excluir publicações que, a seu exclusivo critério, sejam consideradas indevidas ou inconvenientes. Além disso, o AZEROX terá sempre liberdade para'
                'banir, temporária ou definitivamente, os usuários que não respeitarem as regras de utilização.'
                'Fornecer informação falsa ou utilizar dados de terceiros constitui crime previsto no Código Penal Brasileiro. Em havendo dano ou prejuízo a terceiros, ou ao AZEROX, em virtude de ação ilegal de'
                'determinado usuário, este ficará obrigado a indenizar o AZEROX, sem prejuízo do pagamento de perdas e danos futuramente comprovados.'
                'Em havendo a referida utilização de dados falsos, o AZEROX se reserva o direito de encerrar o register do usuário assim que tomar conhecimento da falsidade ou da má-fé empregadas pelo usuário,'
                'podendo impedir seu posterior regresso nos serviços oferecidos pelo site, sem quaisquer ressarcimentos.'
                'No momento do register, o usuário escolherá uma senha e uma identificação pessoal, que deverão ser mantidos em sigilo. Caso o usuário seja notificado ou tome ciência que sua senha e/ou'
                'identificação pessoal está sendo usada por terceira pessoa, ele deverá notificar, imediatamente o AZEROX.',
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              Text('4- POLITICA DE EXCLUSÃO DE DADOS DO USUÁRIO DO AZEROX',
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 20),
              Text(
                'O usuário responsabiliza-se pela titularidade das informações pessoais que transmite ao AZEROX, sendo certo que o site não se responsabiliza pela veracidade das informações prestadas por seus usuários.'
                'O fornecimento de informações falsas configura o crime de falsidade ideológica, tipificado no art. 299 do Código Penal, de forma que, constatando o AZEROX a falsidade nas informações prestadas,'
                'poderá excluir o usuário do site, sem prévia comunicação, até que, se for o caso, a situação reste esclarecida.'
                'O AZEROX faz uso da mais alta e adequada tecnologia disponível no mercado para garantir a segurança e a proteção de seus dados contra o acesso de pessoas não autorizadas ou o uso inadequado.'
                'A senha utilizada pelo usuário para o seu acesso à sua conta é confidencial e criptografada, o que garante o sigilo e a segurança das informações. É importante que o usuário evite escolher senhas'
                'simples, como telefones e datas de aniversário, dificultando-se, assim, a utilização não autorizada por terceiros mal intencionados.'
                'Caso o AZEROX identifique que o conteúdo utilizado pelo usuário conflita com os termos previstos neste instrumento, terá direito de excluir o perfil do usuário.'
                'Poderá também o AZEROX editar ou alterar o perfil do usuário e, em casos mais graves, excluí-los, quando identificar a utilização de linguagem ofensiva ou que faça apologia a práticas ilegais/crimes'
                'ou que atentem contra a lei, a moral ou aos bons costumes.'
                'Caso o AZEROX venha a ser processado em virtude de ato cometido por seus usuários, ser-lhe-á garantido o direito de regresso em face do causador do dano.',
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
