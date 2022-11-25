import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/components/snackbar_error_alert.dart';
import '../../view/home.dart';

Future<void> logarUsuarioEmailSenha(String login, String senha) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: login, password: senha);
    if (credential.user != null) {
      print(credential.user);
      print('logado');
      Get.off(() => const HomeScreen());
    }
  } on FirebaseAuthException catch (error_auth) {
    print(error_auth.code);
    switch (error_auth.code) {
      case 'invalid-email':
        snackbar_error_alert("E-mail inválido!", "A formatação do e-mail é incorreta, por favor corrija!");
        break;
      case 'unknown':
        snackbar_error_alert( "Campos vazios!", "Os campos estão vazios, por favor preencha corretamente");
        break;
      case 'user-not-found':
        snackbar_error_alert( "Erro no Firebase!", "Usuário não encontrado na Base de Dados");
        break;

    }
  }
}
