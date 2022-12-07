import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modelview/controllers/controller_user_details.dart';
import 'styles/colors.dart';

class DetailsEditalScreen extends StatefulWidget {
  const DetailsEditalScreen({Key? key}) : super(key: key);

  @override
  State<DetailsEditalScreen> createState() => _DetailsEditalScreenState();
}

class _DetailsEditalScreenState extends State<DetailsEditalScreen> {
  final ControllerGetUserDetails controllerDadosPost = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Detalhes do Edital'),
      ),
      body: Column(
        children: [
          Image.network('${controllerDadosPost.currentPostUrl}'),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '${controllerDadosPost.currentPostTitle}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                '${controllerDadosPost.currentPostBody}. Caso deseja inscrever-se nesse edital, por favor, clique no botão abaixo:',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              width: 350,
              height: 40,
              child: ElevatedButton.icon(
                  style: TextButton.styleFrom(
                      backgroundColor: ColorsStyle().primaryColor),
                  onPressed: () {},
                  icon: Icon(Icons.app_registration_rounded),
                  label: Text("Inscrever-se neste edital")),
            ),
          ),
        ],
      ),
    );
  }
}
