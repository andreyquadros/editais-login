import 'package:editais_app/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/styles/colors.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: ColorsStyle().formsGerais,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorsStyle().formsGerais),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorsStyle().formsGerais),
        ),
      ),
    ),
    home: LoginScreen(),
  ));
}