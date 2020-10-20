import 'dart:ui';

import 'package:flutter/material.dart';

class Fruta extends StatelessWidget {
  final color;
  final imageNumber;
  const Fruta(
    this.color,
    this.imageNumber, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: Image.asset("assets/images/$imageNumber.png").image),
          // borderRadius: BorderRadius.all(Radius.circular(100) )
        ));
  }
}
