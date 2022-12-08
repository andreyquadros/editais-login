import 'package:editais_app/view/home_screen_new.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../view/components/snackbar_error_alert.dart';
import '../controllers/controller_get_data.dart';

final ControllerGetData controllerUserNew = Get.put(ControllerGetData());

Future<void> logarUsuarioEmailSenha(String login, String senha) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: login, password: senha);
    final user = credential.user;
    if (user != null) {
      controllerUserNew.currentUserEmail.value = user.email!;
      controllerUserNew.currentUserName.value = user.displayName ?? 'Sem nome';
      controllerUserNew.currentUserId.value = user.uid ?? 0.toString();
      controllerUserNew.currentUserPicture.value = user.photoURL ??
          'https://scontent.fpvh5-1.fna.fbcdn.net/v/t39.30808-6/315003790_1193802141562710_2474273782388077165_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=6C6EB_9325cAX-IkENs&_nc_ht=scontent.fpvh5-1.fna&oh=00_AfCOzq9JBAsjCu4Vc6RvpMqCutNoIHplawoJr0Ig8jxwCg&oe=639561E2';
      print(user);
      print('logado');
      Get.off(() => const HomeScreenNew());
    }
  } on FirebaseAuthException catch (error_auth) {
    print(error_auth.code);
    switch (error_auth.code) {
      case 'invalid-email':
        snackbar_error_alert("E-mail inválido!",
            "A formatação do e-mail é incorreta, por favor corrija!");
        break;
      case 'unknown':
        snackbar_error_alert("Campos vazios!",
            "Os campos estão vazios, por favor preencha corretamente");
        break;
      case 'user-not-found':
        snackbar_error_alert(
            "Erro no Firebase!", "Usuário não encontrado na Base de Dados");
        break;
    }
  }
}
