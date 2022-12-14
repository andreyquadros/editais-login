import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:editais_app/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/position/gf_position.dart';

import '../modelview/controllers/controller_user_details.dart';
import 'components/custom_drawer.dart';
import 'details_edital_screen.dart';

class HomeScreenNew extends StatefulWidget {
  const HomeScreenNew({Key? key}) : super(key: key);

  @override
  State<HomeScreenNew> createState() => _HomeScreenNewState();
}

class _HomeScreenNewState extends State<HomeScreenNew> {
  final ControllerGetUserDetails controllerDetails =
      Get.put(ControllerGetUserDetails());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Editais Abertos'),
        actions: [
          GestureDetector(
              onTap: () {
                Get.offAll(() => LoginScreen());
              },
              child: Icon(Icons.login_outlined)),
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

                    /// como se eu estivesse executando um for doc in documents
                    return ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,

                        /// childen: [GfCard, Text... ]
                        /// //documents.map
                        /// Instance of {QuerySnapshot}
                        /// snapshot.data
                        /// {id.document [colecao.title, colecao.body....]}
                        /// {id.document [colecao.title, colecao.body....]}
                        /// {id.document [colecao.title, colecao.body....]}
                        /// {id.document [colecao.title, colecao.body....]}
                        /// {id.document [colecao.title, colecao.body....]}
                        children: documents
                            .map((doc) => GestureDetector(
                                  /// {id.document [colecao.title, colecao.body....]}
                                  /// for doc in documents
                                  onTap: () {
                                    controllerDetails.currentPostTitle.value =
                                        doc['title'];
                                    controllerDetails.currentPostBody.value =
                                        doc['body'];
                                    controllerDetails.currentPostUrl.value =
                                        doc['urlImage'];
                                    controllerDetails.currentPostId.value =
                                        doc.id;

                                    /// doc['id']

                                    Get.to(() => DetailsEditalScreen());
                                  },
                                  child: GFCard(
                                    boxFit: BoxFit.cover,
                                    titlePosition: GFPosition.start,
                                    image: Image.network(
                                      doc['urlImage'],
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                    showImage: true,
                                    title: GFListTile(
                                      avatar: GFAvatar(
                                        backgroundImage: NetworkImage(
                                          doc['urlImage'],
                                        ),
                                      ),
                                      titleText: '${doc['title']}',
                                      subTitleText: '${doc['body']}',
                                      //description: Text('${doc['urlImage']}'),
                                    ),
                                  ),
                                ))
                            .toList());
                  } else if (snapshot.hasError) {
                    return Text('Ops... Erro!');
                  }
                  return Text('Vazio, erro!');
                })
          ],
        ),
      ),
    );
  }
}
