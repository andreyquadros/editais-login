import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:editais_app/modelview/controllers/controller_results_details.dart';
import 'package:editais_app/view/components/custom_drawer.dart';
import 'package:editais_app/view/login_screen.dart';
import 'package:editais_app/view/results_details_edital_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/position/gf_position.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  final ControllerResultsDetails controllerResultsDetails =
      Get.put(ControllerResultsDetails());

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Resultados por Edital'),
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
                future: FirebaseFirestore.instance
                    .collection('posts')
                    .orderBy('id', descending: true)
                    .get(),
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
                        children: documents
                            .map((doc) => GestureDetector(
                                  onTap: () {
                                    controllerResultsDetails
                                        .currentPostTitle.value = doc['title'];
                                    controllerResultsDetails
                                        .currentPostBody.value = doc['body'];
                                    controllerResultsDetails
                                        .currentPostUrl.value = doc['urlImage'];
                                    controllerResultsDetails
                                        .currentPostId.value = doc.id;

                                    if (doc['userId'] != null) {
                                      controllerResultsDetails
                                          .currentUsersSubscriptions
                                          .value = doc['userId'];
                                    } else {
                                      controllerResultsDetails
                                          .currentUsersSubscriptions.value = [];
                                    }

                                    Get.to(() => ResultsDetailsEditalScreen());
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
