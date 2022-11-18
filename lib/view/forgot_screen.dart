import 'package:editais_app/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_text/styled_text.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar a Senha'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 250,
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
                    width: 200,
                    child: Image.asset('images/logoifro.png'),
                  ),
                ),
              ),
            ],
          ),
          Container(
              width: 350,
              height: 30,
              child: Text('Digite o e-mail que deseja recuperar a senha: ')),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 20),
            child: TextFormField(
              controller: null,
              keyboardType: TextInputType.emailAddress,
              cursorColor: ColorsStyle().formsGerais,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: ColorsStyle().formsGerais)),
                hintText: 'E-mail',
              ),
            ),
          ),
          Container(
            width: 350,
            height: 50,
            child: ElevatedButton.icon(
                style: TextButton.styleFrom(backgroundColor: ColorsStyle().botao),
                onPressed: () {},
                icon: Icon(Icons.send),
                label: Text("Recuperar Senha por E-mail")),
          ),
        ],
      ),
    );
  }
}
