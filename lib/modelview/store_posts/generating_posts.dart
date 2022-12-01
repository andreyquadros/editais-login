import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:editais_app/model/Posts.dart';

void generating_posts(int userId, int id, String title, String body, String urlImage) {
  FirebaseFirestore db = FirebaseFirestore.instance;

  final Posts posts = Posts(userId: userId, id: id, title: '${title}', body: '${body}', urlImage: '${urlImage}');

  db.collection("posts").add(posts.toMap()).then((DocumentReference doc) =>
      print('Post adicionado com o ID: ${doc.id}'));
}
