import 'dart:math';

import 'package:flutter/material.dart';

class Roberto extends StatelessWidget {
  final String direction;
  final double velocidade;
  const Roberto(
    this.direction,
    this.velocidade, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return roberto();
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: roberto(),
      );
    }
  }

  Widget roberto() {
    return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: Image.asset(velocidade == 0.0
                      ? "assets/images/roberto_parado.png"
                      : velocidade == 1.0
                          ? "assets/images/roberto_correndo1.png"
                          : velocidade == 2.0
                              ? "assets/images/roberto_correndo2png"
                              : velocidade == -1.0
                                  ? "assets/images/roberto_caido.png"
                                  : "assets/images/roberto_correndo3png")
                  .image),
        ));
  }
}
