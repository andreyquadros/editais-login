import 'dart:async';

import 'package:editais_app/modelview/auth/email_pass_auth_register.dart';
import 'package:editais_app/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController _controladorEmail = TextEditingController();
  TextEditingController _controladorSenha = TextEditingController();

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Conta'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/bg_ifro.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Container(
                      width: 170,
                      child: Image.asset('images/logoifro.png'),
                    ),
                  ),
                ),
              ],
            ),
            Container(
                width: 350,
                height: 30,
                child: const Text('Por favor preencha as informações a seguir: ')),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 5),
              child: TextFormField(
                controller: _controladorEmail,
                keyboardType: TextInputType.emailAddress,
                cursorColor: ColorsStyle().formsGerais,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: ColorsStyle().formsGerais)),
                  hintText: 'E-mail',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 10),
              child: TextFormField(
                controller: _controladorSenha,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: ColorsStyle().formsGerais,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: ColorsStyle().formsGerais)),
                  hintText: 'Senha',
                ),
              ),
            ),
            Container(
              width: 350,
              height: 45,
              child: ElevatedButton.icon(
                  style: TextButton.styleFrom(backgroundColor: ColorsStyle().botao),
                  onPressed: () async {
                    await Future.delayed(const Duration(seconds: 2), () async{
                      _timer?.cancel();
                      await EasyLoading.show(
                        status: 'Carregando...',
                        maskType: EasyLoadingMaskType.black,
                      );
                      await registerUser(_controladorEmail.text, _controladorSenha.text);
                      EasyLoading.dismiss();
                      _controladorSenha.clear();
                      _controladorEmail.clear();
                    });

                  },
                  icon: const Icon(Icons.app_registration),
                  label: const Text("Registrar")),
            ),
          ],
        ),
      ),
    );
  }
}