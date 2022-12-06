import 'package:editais_app/view/home_screen_new.dart';
import 'package:editais_app/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../modelview/controllers/controller_get_data.dart';

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
                  "https://scontent.fpvh5-1.fna.fbcdn.net/v/t39.30808-6/272153085_4747891471924470_6466354893464882265_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=1epKmXnMap4AX-nT9UU&_nc_ht=scontent.fpvh5-1.fna&oh=00_AfBLacOcGvzy4CJ9X7VnBef-iG4ywxw4P2zwJVIb6Tmugw&oe=6393F1F1",
                  scale: 80),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Obx(() => Text(
                      '${controllerDados.currentUserName.value} - ${controllerDados.currentUserId}',
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
            onTap: () {},
          ),
          ListTile(
            title: Text('Contato'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Atualizar Perfil'),
            onTap: () {},
          ),
          ListTile(
            selected: true,
            selectedColor: Colors.red,
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 220),
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
              Get.offAll(() => LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
