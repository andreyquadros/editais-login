import 'package:cached_network_image/cached_network_image.dart';
import 'package:editais_app/view/components/form_login_component.dart';
import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/bg_ifro.png"),
                  fit: BoxFit.cover),
            ),
            ),
          FormLoginComponent(),
          ],

        )));
  }
}
