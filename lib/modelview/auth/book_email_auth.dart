import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../view/components/snackbar_error_alert.dart';
import '../../view/components/snackbar_sucess_alert.dart';
import '../controllers/controller_user_details.dart';

final ControllerGetUserDetails controllerDetails = Get.find();

void book_email_auth() async {
  final credential = await FirebaseAuth.instance.currentUser;
  try {
    if (credential != null) {
      String? email = credential.email;
      String id = controllerDetails.currentPostId.value;
      String timeStamp = DateTime.now().toString();
      FirebaseFirestore db = FirebaseFirestore.instance;

      db.collection("posts").doc("${id}").set({
        "userId": FieldValue.arrayUnion(
          [
            {"email": email, "time": timeStamp},
          ],
        ),
      }, SetOptions(merge: true));
    }
    snackbar_sucess_alert('Sucesso!', 'Inscrito com sucesso no edital!');
  } on FirebaseAuthException catch (error) {
    print(error.code);
    snackbar_error_alert('Erro!!', 'Não foi possível se inscrever no Edital!');
  }
}
