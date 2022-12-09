import 'package:editais_app/view/book_edital.dart';
import 'package:editais_app/view/contact_screen.dart';
import 'package:editais_app/view/home_screen_new.dart';
import 'package:editais_app/view/login_screen.dart';
import 'package:editais_app/view/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../modelview/controllers/controller_get_data.dart';
import '../update_data_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final ControllerGetData controllerDados = Get.find();

  @override
  Widget build(BuildContext context) {
    return GFDrawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          GFDrawerHeader(
            currentAccountPicture: GFAvatar(
              shape: GFAvatarShape.circle,
              size: 300,
              backgroundImage: NetworkImage(
                  "${controllerDados.currentUserPicture.value}",
                  scale: 80),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Obx(() => Text(
                      '${controllerDados.currentUserName.value} ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                Obx(() => Text(
                      controllerDados.currentUserEmail.value,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    )),
              ],
            ),
          ),
          ListTile(
            title: Text('Lista de Editais Abertos'),
            onTap: () {
              Get.offAll(() => HomeScreenNew());
            },
          ),
          ListTile(
            title: Text('Resultados'),
            onTap: () {
              Get.to(() => ResultsScreen());
            },
          ),
          ListTile(
            title: Text('Contato'),
            onTap: () {
              Get.to(() => ContactScreen());
            },
          ),
          ListTile(
            title: Text('Atualizar Perfil'),
            onTap: () {
              Get.to(() => UpdateDataScreen());
            },
          ),
          ListTile(
            selected: true,
            selectedColor: Colors.teal,
            title: Row(
              children: [
                Text(
                  'Inscrever-se',
                  style: TextStyle(fontSize: 18),
                ),
                Icon(Icons.app_registration_outlined),
              ],
            ),
            onTap: () {
              Get.offAll(() => BookScreen());
              //controllerDados.refresh();
              //Get.offAll(() => LoginScreen());
            },
          ),
          ListTile(
            selected: true,
            selectedColor: Colors.red,
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 150),
              child: Row(
                children: [
                  Icon(Icons.logout_rounded),
                  Text(
                    '    Logout',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            onTap: () {
              controllerDados.refresh();
              Get.offAll(() => LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
