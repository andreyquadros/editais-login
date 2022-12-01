
import 'package:cloud_firestore/cloud_firestore.dart';

  Future<QuerySnapshot> getPosts() async {
    //var listAux = [];
    var db = FirebaseFirestore.instance;
    final dataPosts = await db.collection("posts").get().then((event) {
      for (var doc in event.docs) {
        //listAux.add(doc.data());
        print("${doc.id} => ${doc.data()}");
      }
    });
    print(dataPosts.toString());
  return dataPosts;
  }


