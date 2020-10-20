import 'package:Jeredy/controller/game_controller.dart';
import 'package:Jeredy/ui/game/fruta/fruta.dart';
import 'package:Jeredy/ui/game/fruta/sombra.dart';
import 'package:Jeredy/ui/game/personagem/roberto.dart';
import 'package:Jeredy/ui/game/personagem/sombra.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GamePage extends GetView<GameController> {
  @override
  Widget build(BuildContext context) {
    //TODO: IMPLEMENTAR METODO PARA CALCULAR AREA EXATA DA FRUTA
    //TODO: MUDAR TODOS OS SPRITES
    //TODO: IMPLEMENTAR MENU DE JOGO
    //TODO: IMPLEMENTAR RANKING

    return Scaffold(
        body: Stack(
      children: [
        GetBuilder(
          init: controller,
          global: false,
          builder: (GameController controller) => Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset("assets/images/Bg.png")
                                      .image)),
                        ),
                        Container(
                          alignment: Alignment(0, 2),

                          child: Image.asset(
                              "assets/images/lands/Land${controller.land}.png"),
                          // decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         fit: BoxFit.cover,
                          //         image: Image.asset(
                          //                 "")
                          //             .image)),
                        ),
                        Container(
                          alignment: Alignment(
                              controller.fruta1.posx, controller.roberto.posy),
                          child: Sombra(
                              controller.roberto.posy - controller.fruta1.posy),
                        ),
                        Container(
                          alignment: Alignment(
                              controller.fruta2.posx, controller.roberto.posy),
                          child: Sombra(
                              controller.roberto.posy - controller.fruta2.posy),
                        ),
                        Container(
                          alignment: Alignment(
                              controller.fruta3.posx, controller.roberto.posy),
                          child: Sombra(
                              controller.roberto.posy - controller.fruta3.posy),
                        ),
                        Container(
                          alignment: Alignment(
                              controller.fruta4.posx, controller.roberto.posy),
                          child: Sombra(
                              controller.roberto.posy - controller.fruta4.posy),
                        ),
                        Container(
                          alignment: Alignment(
                              controller.fruta5.posx, controller.roberto.posy),
                          child: Stack(
                            children: [
                              Sombra(controller.roberto.posy -
                                  controller.fruta5.posy),
                              // Text(
                              //     "PosX: ${(controller.fruta5.posx).toStringAsFixed(2)} PosY: ${(controller.roberto.posy).toStringAsFixed(2)}")
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment(
                              controller.fruta6.posx, controller.roberto.posy),
                          child: Sombra(
                              controller.roberto.posy - controller.fruta6.posy),
                        ),
                        Container(
                          alignment: Alignment(
                              controller.fruta1.posx, controller.fruta1.posy),
                          child: Fruta(Colors.amber, 1),
                        ),
                        Container(
                          alignment: Alignment(
                              controller.fruta2.posx, controller.fruta2.posy),
                          child: Fruta(Colors.brown, 2),
                        ),
                        Container(
                          alignment: Alignment(
                              controller.fruta3.posx, controller.fruta3.posy),
                          child: Fruta(Colors.pink, 3),
                        ),
                        Container(
                          alignment: Alignment(
                              controller.fruta4.posx, controller.fruta4.posy),
                          child: Fruta(Colors.blueGrey, 4),
                        ),
                        Container(
                          alignment: Alignment(
                              controller.fruta5.posx, controller.fruta5.posy),
                          child: Stack(
                            children: [
                              Fruta(Colors.yellow, 5),
                              // Text(
                              //     "PosX: ${(controller.fruta5.posx).toStringAsFixed(2)} PosY: ${(controller.fruta5.posy).toStringAsFixed(2)}")
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment(
                              controller.fruta6.posx, controller.fruta6.posy),
                          child: Fruta(Colors.deepOrange, 1),
                        ),
                        Container(
                          alignment: Alignment(controller.roberto.posx,
                              controller.roberto.posy + 0.02),
                          child: SombraPersonagem(
                              (0.0 - controller.roberto.posx).abs()),
                        ),
                        Container(
                            // color: Colors.blue,

                            child: AnimatedContainer(
                          alignment: Alignment(
                              controller.roberto.posx, controller.roberto.posy),
                          duration: Duration(milliseconds: 0),
                          child: Roberto(controller.roberto.direcao,
                              controller.roberto.velocidade),
                        )),
                        Container(
                          alignment: Alignment(0, 0),
                          height: 10,
                          width: int.parse(controller.tempoBarr()) /
                              Get.width *
                              10000,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.blue,
                                  Colors.red,
                                  Colors.green
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            alignment: Alignment(1, -1),
                            child: Text(
                              "Score: ${controller.tempo()}",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: Container(color: Colors.transparent))
                ],
              ),
              !controller.colisao
                  ? Column(
                      children: [
                        Container(
                          height: 85,
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: IconButton(
                                    icon: Icon(
                                      controller.isPlay
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      size: 40,
                                    ),
                                    onPressed: () => controller.pauseGame()),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: Get.height - 100,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                      onTapDown: (detalhes) {
                                        controller.isMoveRight = true;
                                        controller.moveLeft();
                                      },
                                      onTapUp: (detalhes) =>
                                          controller.parado(1),
                                      onTapCancel: () => controller.parado(1),
                                      child: Container(
                                          color: Colors.transparent))),
                              Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                      onTapDown: (detalhes) {
                                        controller.isMoveLeft = true;
                                        controller.moveRight();
                                      },
                                      onTapUp: (detalhes) =>
                                          controller.parado(0),
                                      onTapCancel: () => controller.parado(0),
                                      child: Container(
                                          color: Colors.transparent))),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(
                      height: Get.height,
                      width: Get.width,
                      color: Colors.black38,
                      child: RaisedButton(
                        color: Colors.black38,
                        onPressed: () => controller.restart(),
                        child: Center(
                          child: Text(
                            "Game Over\nTAP TO RESTART",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ],
    ));
  }
}
