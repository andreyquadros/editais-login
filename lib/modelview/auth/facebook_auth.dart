import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

import '../../view/home.dart';

void logarFacebook() async {

  try{
    final facebookLoginResult = await FacebookAuth.instance.login();
    final userData = await FacebookAuth.instance.getUserData();
    final facebookAuthCredential = FacebookAuthProvider.credential(facebookLoginResult.accessToken!.token);
    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

    await FirebaseFirestore.instance.collection('users').add({
      'email': userData['email'],
      'imageUrl': userData['picture']['data']['url'],
      'name' : userData['name'],
    });
    Get.off(()=> const HomeScreen());
  }on FirebaseAuthException catch(e){
    print('O erro em questão foi o: ${e}');
    var title = '';
    switch (e.code){
      case 'account-exists-with-different-credential':
        title = 'Esta conta existe com uma credencial diferente';
        break;
    }
  }finally{
    print('atualizado');
    // setState(){
    //   loading = false;
    // }
  }
}