import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  Future<void> _launchInWebViewWithoutJavaScript(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
    )) {
      throw 'Could not launch $url';
    }
  }

  final Uri _url = Uri.parse('https://www.instagram.com/ifro_oficial');

  Future<void> _abrirURL() async {
    if (!await launchUrl(_url)) {
      throw 'Não pode inicializar $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fale Conosco'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: SizedBox(
                height: 250,
                child: Image.network(
                    'https://portal.ifro.edu.br/images/botoes_do_site/menu-de-relevancia/logotipo-IFRO-portal-principal.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 10),
              child: AutoSizeText(
                '''O Instituto Federal de Educação, Ciência e Tecnologia de Rondônia, '''
                '''é uma instituição de ensino superior e técnica brasileira, sediada no'''
                ''' estado de Rondônia. ''',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.justify,
                minFontSize: 18,
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ElevatedButton.icon(
                onPressed: _abrirURL,
                icon: Icon(Icons.more_horiz_outlined),
                label: Text('Saiba mais')),
          ],
        ));
  }
}
