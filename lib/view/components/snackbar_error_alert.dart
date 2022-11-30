import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> snackbar_error_alert(String titulo_erro, String mensagem_erro) async {
  Get.snackbar(
    "Erro",
    "Campos!",
    titleText:  Text(
      "${titulo_erro}",
      style: const TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    messageText: Text(
      "${mensagem_erro}",
      style: const TextStyle(color: Colors.white, fontSize: 15),
    ),
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.white,
    backgroundColor: Colors.white,
    borderRadius: 10,
    barBlur: 30,
    overlayBlur: 20,
    overlayColor: Colors.white70,
    margin: const EdgeInsets.all(30),
    animationDuration: const Duration(milliseconds: 2000),
    backgroundGradient: const LinearGradient(
      colors: [Colors.red, Colors.red],
    ),
    borderColor: Colors.white70,
    borderWidth: 3,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
    duration: const Duration(milliseconds: 2000),
    icon: const Icon(
      Icons.crisis_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    isDismissible: true,
    leftBarIndicatorColor: Colors.white70,
  );
}
