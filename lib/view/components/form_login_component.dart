import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:editais_app/view/forgot_screen.dart';
import 'package:editais_app/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:styled_text/styled_text.dart';

import '../../modelview/auth/email_pass_auth_login.dart';
import '../../modelview/auth/facebook_auth.dart';
import '../register_screen.dart';
class FormLoginComponent extends StatefulWidget {
  const FormLoginComponent({Key? key}) : super(key: key);

  @override
  State<FormLoginComponent> createState() => _FormLoginComponentState();
}

class _FormLoginComponentState extends State<FormLoginComponent> {

  TextEditingController login = TextEditingController();
  TextEditingController senha = TextEditingController();

  Timer? _timer;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Container(
            width: 200,
            child: Image.asset('images/logoifro.png'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 5),
          child: TextFormField(
            controller: login,
            keyboardType: TextInputType.emailAddress,
            cursorColor: ColorsStyle().formsGerais,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.green)),
              hintText: 'E-mail',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 5, 32, 10),
          child: TextFormField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            controller: senha,
            cursorColor: ColorsStyle().formsGerais,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Senha',
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Get.to(()=> ForgotScreen());
            },
          child: Container(
            width: 350,
            height: 25,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(225, 1, 0, 0),
              child: Text('Esqueceu a Senha?'),
            ),
          ),
        ),
        Container(
          width: 350,
          height: 50,
          child: ElevatedButton.icon(
              style: TextButton.styleFrom(backgroundColor: ColorsStyle().botao),
              onPressed: (){
                logarUsuarioEmailSenha(login.text, senha.text);
              },
              icon: Icon(Icons.login),
              label: Text("Logar")),
        ),
        Container(
          width: 350,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(35, 20, 0, 0),
            child: GestureDetector(
              onTap: (){
                Get.to(()=> RegisterScreen());
              },
              child: StyledText(
                text: 'Não tem conta?! <bold>Registre-se agora</bold> mesmo.',
                tags: {
                  'bold': StyledTextTag(style: TextStyle(fontWeight: FontWeight.bold)),
                },
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            width: 350,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: StyledText(
                text: '-----------------------------------------<bold> OU </bold>----------------------------------------',
                tags: {
                  'bold': StyledTextTag(style: TextStyle(fontWeight: FontWeight.bold)),
                },
              ),
            ),
          ),
        ),
        Container(
          width: 350,
          height: 40,
          child: ElevatedButton.icon(
              style: TextButton.styleFrom(backgroundColor: ColorsStyle().botaoFacebook),
              onPressed: logarFacebook,
              icon: Icon(Icons.facebook),
              label: Text("Autenticar pelo Facebook")),
        ),

      ],
    );
  }
}
