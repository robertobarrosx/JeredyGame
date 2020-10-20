import 'package:flutter/material.dart';

class Sombra extends StatelessWidget {
  final distance;

  const Sombra(
    this.distance, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: Image.asset("assets/images/Shadow.png").image),
            // borderRadius: BorderRadius.all(Radius.circular(100) )
          ),
          height: 20,
          width: 20 + 25 * distance,
        ),
      ),
    );
  }
}
