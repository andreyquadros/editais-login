import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:editais_app/view/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

Future<void> registerUser(String controladorEmail, String controladorSenha) async {
  print(controladorEmail);
  try {
    if (controladorEmail != null && controladorSenha != null) {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: controladorEmail, password: controladorSenha);
      credential.user?.sendEmailVerification();
      if (credential.user != null) {
        await FirebaseFirestore.instance.collection('users').add({
          'email': controladorEmail,
          'senha': controladorSenha,
        });
        Get.snackbar(backgroundColor: Color(0xFF0000),
            barBlur: 30.0,
            'Sucesso Cadastro',
            'Criação do cadastro no Firebase').show();
      } else {
        Get.snackbar(
            'Erro no Cadastro', 'Falha na criação do cadastro no Firebase')
            .show();
      }
    } else {
      print('entrei aqui e agora josé');
      Get.snackbar(
          backgroundColor: Color(0xFF0000),
          snackPosition: SnackPosition.BOTTOM,
          barBlur: 30.0,
          'Erro Cadastro',
          'Os campos estão vazios').show();
    }
  } on FirebaseAuthException catch (error_auth_register) {
    print('deu ruim ${error_auth_register.code}');
    var code_message_error = '';
    switch (error_auth_register.code) {
      case 'account-exists-with-different-credential':
        code_message_error = 'Esta conta existe com uma credencial diferente';
        break;
      case 'unknown':
        Get.snackbar(
          "Erro", "Cadastro",
          titleText: Text("Erro no Cadastro!", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
          messageText: Text(
            "Os campos estão vazios",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.white,
          borderRadius: 10,
          barBlur: 30,
          overlayBlur: 20,
          overlayColor: Colors.white70,
          margin: EdgeInsets.all(30),
          animationDuration: Duration(milliseconds: 3000),
          backgroundGradient: LinearGradient(
            colors: [Colors.red, Colors.red],
          ),
          borderColor: Colors.white70,
          borderWidth: 3,
          dismissDirection: DismissDirection.horizontal ,
          forwardAnimationCurve: Curves.easeOutBack,
          duration: Duration(milliseconds: 8000),
          icon: Icon(
            Icons.crisis_alert,
            color: Colors.white,
          ),
          shouldIconPulse: false,
          isDismissible: true,
          leftBarIndicatorColor: Colors.white70,
        );
    }
  }
}
