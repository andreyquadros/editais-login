import 'package:editais_app/modelview/controllers/controller_results_details.dart';
import 'package:editais_app/view/components/custom_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

class ResultsDetailsEditalScreen extends StatefulWidget {
  const ResultsDetailsEditalScreen({Key? key}) : super(key: key);

  @override
  State<ResultsDetailsEditalScreen> createState() =>
      _ResultsDetailsEditalScreenState();
}

class _ResultsDetailsEditalScreenState
    extends State<ResultsDetailsEditalScreen> {
  final ControllerResultsDetails controllerResultsDetails = Get.find();

  @override
  Widget build(BuildContext context) {
    double inscritos =
        controllerResultsDetails.currentUsersSubscriptions.length.toDouble();

    List<dynamic> emails =
        controllerResultsDetails.currentUsersSubscriptions.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Resultado do Edital'),
      ),
      body: Column(
        children: [
          Image.network('${controllerResultsDetails.currentPostUrl}'),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '${controllerResultsDetails.currentPostTitle}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
              child: Text(
                '${controllerResultsDetails.currentPostBody}. Confira os resultados do respectivo edital abaixo:',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
              child: Text(
                'Número de inscritos no edital: ${controllerResultsDetails.currentUsersSubscriptions.length}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 80, 30, 10),
            child: CustomProgressBar(
                porcentagem: controllerResultsDetails
                    .currentUsersSubscriptions.length
                    .toDouble()),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 80, 30, 10),
            child: GFAccordion(
                title: 'Emails Inscritos',
                content: '${emails.map((e) => e['email'])}'),
          ),
        ],
      ),
    );
  }
}
