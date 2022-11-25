import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/components/snackbar_error_alert.dart';
import '../../view/components/snackbar_sucess_alert.dart';
import '../../view/home.dart';

void recuperarSenha(String email) async {
  try {
    final credential = await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    snackbar_sucess_alert('Sucesso!','Foi enviado um e-mail para resetar a senha!');
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
