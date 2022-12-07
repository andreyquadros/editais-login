import 'package:cloud_firestore/cloud_firestore.dart';

void update_post_registerUser() {
  String email = 'andrey.quadros@ifraaadddo.edu.br';
  String id = 'BhvWuiqnEjbNafjN0JFL';
  FirebaseFirestore db = FirebaseFirestore.instance;
  final userId = {"email": email};
  Map<String, dynamic> inscritos = {
    "email": email,
  };
  //db.collection("posts").doc("${id}").set(inscritos, SetOptions(merge: true));
  db.collection("posts").doc("${id}").set({
    "userId": FieldValue.arrayUnion(
      [
        {"email": email, "timeStamp": "Dec 12"},
      ],
    ),
  }, SetOptions(merge: true));
}
