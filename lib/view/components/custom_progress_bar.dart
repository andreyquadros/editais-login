import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CustomProgressBar extends StatelessWidget {
  double porcentagem;
  CustomProgressBar({Key? key, required this.porcentagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double calculo;
    if (porcentagem != 0) {
      calculo = porcentagem / 10;
    } else {
      calculo = 0;
    }
    return Container(
      child: GFProgressBar(
          percentage: calculo,
          width: 100,
          radius: 140,
          type: GFProgressType.circular,
          backgroundColor: Colors.black12,
          circleWidth: 20,
          animation: true,
          progressBarColor: GFColors.SUCCESS),
    );
  }
}
