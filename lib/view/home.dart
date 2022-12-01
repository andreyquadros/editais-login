import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:editais_app/view/details_edital_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editais Abertos '),
        actions: [
          GestureDetector(
              onTap: () {
                Get.offAll(() => LoginScreen());
              },
              child: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance.collection('posts').get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<DocumentSnapshot> documents =
                        snapshot.data!.docs;
                    return ListView(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: documents
                            .map((doc) => Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => DetailsEditalScreen());
                                    },
                                    child: GFCard(
                                      image: Image.network(
                                        doc['urlImage'],
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                      ),
                                      showImage: true,
                                      title: GFListTile(
                                        titleText: '${doc['title']}',
                                        subTitleText: '${doc['body']}',
                                      ),
                                      // buttonBar: GFButtonBar(
                                      //   children: <Widget>[
                                      //     GFAvatar(
                                      //       backgroundColor: GFColors.DANGER,
                                      //       child: Icon(
                                      //         Icons.app_registration,
                                      //         color: Colors.white,
                                      //       ),
                                      //     ),
                                      //     GFAvatar(
                                      //       backgroundColor: GFColors.PRIMARY,
                                      //       child: Icon(
                                      //         Icons.share,
                                      //         color: Colors.white,
                                      //       ),
                                      //     ),
                                      //     GFAvatar(
                                      //       backgroundColor: GFColors.SUCCESS,
                                      //       child: Icon(
                                      //         Icons.whatsapp,
                                      //         color: Colors.white,
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                    ),
                                  ),
                                ))
                            .toList());
                  } else if (snapshot.hasError) {
                    return Text(' Ops... Erro!');
                  }
                  return Text(' Ops... Erro!');
                }),
          ],
        ),
      ),
    );
  }
}
