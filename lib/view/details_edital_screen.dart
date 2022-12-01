import 'package:flutter/material.dart';

class DetailsEditalScreen extends StatefulWidget {
  const DetailsEditalScreen({Key? key}) : super(key: key);

  @override
  State<DetailsEditalScreen> createState() => _DetailsEditalScreenState();
}

class _DetailsEditalScreenState extends State<DetailsEditalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Detalhes do Edital'),
      ),
    );
  }
}
