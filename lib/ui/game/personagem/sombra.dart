import 'package:flutter/material.dart';

class SombraPersonagem extends StatelessWidget {
  final distance;

  const SombraPersonagem(
    this.distance, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
            fit: BoxFit.fill,
            image: Image.asset("assets/images/Shadow.png").image),
        // borderRadius: BorderRadius.all(Radius.circular(100) )
      ),
      height: 10,
      width: 45 + 25 * distance,
    );
  }
}
