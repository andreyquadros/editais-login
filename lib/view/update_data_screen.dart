import 'package:flutter/material.dart';

import '../modelview/auth/update_data.dart';
import 'styles/colors.dart';

class UpdateDataScreen extends StatefulWidget {
  const UpdateDataScreen({Key? key}) : super(key: key);

  @override
  State<UpdateDataScreen> createState() => _UpdateDataScreenState();
}

class _UpdateDataScreenState extends State<UpdateDataScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController fotoURL = TextEditingController();
  TextEditingController nome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atualização Cadastral'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 40, 32, 5),
            child: TextFormField(
              controller: nome,
              keyboardType: TextInputType.name,
              cursorColor: ColorsStyle().formsGerais,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green)),
                hintText: 'Nome Completo:',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 25),
            child: TextFormField(
              controller: fotoURL,
              keyboardType: TextInputType.text,
              cursorColor: ColorsStyle().formsGerais,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green)),
                hintText: 'URL da Foto:',
              ),
            ),
          ),
          Container(
            width: 350,
            height: 50,
            child: ElevatedButton.icon(
                style:
                    TextButton.styleFrom(backgroundColor: ColorsStyle().botao),
                onPressed: () {
                  atualizarUsuarioEmailSenha(nome.text, fotoURL.text);
                },
                icon: Icon(Icons.update),
                label: Text("Atualizar Cadastro")),
          ),
        ],
      ),
    );
  }
}
