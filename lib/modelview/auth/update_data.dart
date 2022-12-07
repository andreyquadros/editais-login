import 'package:editais_app/view/components/snackbar_sucess_alert.dart';
import 'package:editais_app/view/home_screen_new.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../controllers/controller_get_data.dart';

final ControllerGetData controllerDados = Get.put(ControllerGetData());

Future<void> atualizarUsuarioEmailSenha(String nome, String foto) async {
  final credential = await FirebaseAuth.instance.currentUser;
  try {
    if (credential != null) {
      credential.updateDisplayName(nome);
      credential.updatePhotoURL(foto);
      controllerDados.currentUserPicture.value = foto;
      controllerDados.currentUserName.value = nome;
    }
    snackbar_sucess_alert('Sucesso!', 'Dados atualizados com sucesso');
    Get.offAll(() => HomeScreenNew());
  } on FirebaseAuthException catch (error) {
    print(error.code);
  }
}
