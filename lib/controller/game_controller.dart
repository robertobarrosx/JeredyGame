import 'dart:async';
import 'dart:math';
import 'package:Jeredy/ui/game/personagem/robertoModel.dart';
import 'package:get/get.dart';
import 'package:wakelock/wakelock.dart';

class GameController extends GetxController {
  final _roberto = (ObjetoModel()).obs;
  final _fruta1 = (ObjetoModel()).obs;
  final _fruta2 = (ObjetoModel()).obs;
  final _fruta3 = (ObjetoModel()).obs;
  final _fruta4 = (ObjetoModel()).obs;
  final _fruta5 = (ObjetoModel()).obs;
  final _fruta6 = (ObjetoModel()).obs;
  final _moveRight = false.obs;
  final _moveLeft = false.obs;
  final _colisao = false.obs;
  final _land = 0.obs;
  final _isPlay = false.obs;
  final _direcao = "down".obs;
  final _tempoInicial = DateTime.now().obs;
  final _tempoFinal = "0".obs;
  final _tempoBar = "0".obs;
  final _tempoBarra = DateTime.now().obs;
  final _tempoPausado = DateTime.now().obs;

  get tempoPausado => _tempoPausado.value;
  set tempoPausado(v) => _tempoPausado.value = v;
  get land => _land.value;
  set land(v) => _land.value = v;
  get tempoFinal => _tempoFinal.value;
  set tempoFinal(v) => _tempoFinal.value = v;
  get tempoBar => _tempoBar.value;
  set tempoBar(v) => _tempoBar.value = v;
  get tempoBarra => _tempoBarra.value;
  set tempoBarra(v) => _tempoBarra.value = v;
  get colisao => _colisao.value;
  set colisao(v) => _colisao.value = v;
  get direcao => _direcao.value;
  set direcao(v) => _direcao.value = v;

  get tempoInicial => _tempoInicial.value;
  set tempoInicial(v) => _tempoInicial.value = v;

  get isPlay => _isPlay.value;
  set isPlay(v) => _isPlay.value = v;

  get isMoveRight => _moveRight.value;
  set isMoveRight(v) => {_moveRight.value = v, update()};

  get isMoveLeft => _moveLeft.value;
  set isMoveLeft(v) => {_moveLeft.value = v, update()};
  get roberto => _roberto.value;
  set roberto(v) => _roberto.value = v;
  get fruta1 => _fruta1.value;
  set fruta1(v) => _fruta1.value = v;
  get fruta2 => _fruta2.value;
  set fruta2(v) => _fruta2.value = v;
  get fruta3 => _fruta3.value;
  set fruta3(v) => _fruta3.value = v;
  get fruta4 => _fruta4.value;
  set fruta4(v) => _fruta4.value = v;
  get fruta5 => _fruta5.value;
  set fruta5(v) => _fruta5.value = v;
  get fruta6 => _fruta6.value;
  set fruta6(v) => _fruta6.value = v;

  moveRight() {
    if (!isPlay) return;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (isMoveLeft && isPlay) {
        if (roberto.posx < 1) {
          roberto.direcao = "right";
          changeVelocidade();
          if (!isMoveRight) roberto.posx += 0.03;
        } else
          isMoveLeft = false;
        // print(roberto);
        update();
      } else {
        timer.cancel();
      }
    });
  }

  changeVelocidade() {
    if (roberto.velocidade == 0.0)
      roberto.velocidade = 1.0;
    else if (roberto.velocidade > 2.0)
      roberto.velocidade = 1.0;
    else if (roberto.velocidade == 2.0)
      roberto.velocidade = 3.0;
    else if (roberto.velocidade == 1.0) roberto.velocidade = 2.0;
  }

  moveLeft() {
    if (!isPlay) return;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (isMoveRight && isPlay) {
        if (roberto.posx > -1) {
          roberto.direcao = "left";
          changeVelocidade();
          if (!isMoveLeft) roberto.posx -= 0.03;
        } else
          isMoveRight = false;
        // print(roberto);
        update();
      } else {
        timer.cancel();
      }
    });
  }

  ObjetoModel autoDefautLeft() {
    ObjetoModel p = ObjetoModel();
    p.posx = (Random().nextDouble() * 1) - 2;
    p.posy = -2.0 + (Random().nextDouble() * 1);
    p.direcao = "down";
    p.velocidade = (Random().nextDouble()) * 0.01;

    return p;
  }

  isColisao(ObjetoModel fruta) {
    // print("======================");
    if (colisao) return true;
    // double valor = + ;
    // print(valor);
    // if (valor < 0) valor = valor * -1;
    if ((roberto.posx - fruta.posx).abs() < 0.25 &&
        (roberto.posy - fruta.posy).abs() < 0.25) {
      isPlay = false;
      roberto.velocidade = -1.0;
      return true;
    }
    return false;
  }

  parado(number) {
    if (number == 0) {
      isMoveLeft = false;
    } else
      isMoveRight = false;
    roberto.velocidade = 0.0;
  }

  ObjetoModel autoDefautRight() {
    ObjetoModel p = ObjetoModel();
    p.posx = (Random().nextDouble() * 1) + 2;
    p.posy = -2.0 + (Random().nextDouble() * 1);
    p.direcao = "down";
    p.velocidade = (Random().nextDouble()) * 0.01;
    return p;
  }

  ObjetoModel updateFrutaRight(ObjetoModel obj) {
    if (obj.posy >= 1) obj.direcao = "up";
    if (obj.posy <= Random().nextDouble() - 2.5) obj.direcao = "down";
    if (obj.posx < -1.3) {
      obj = autoDefautRight();
    }
    if (obj.direcao == "down") {
      obj.posx -= 0.003 - obj.velocidade * 0.05;
      obj.posy += 0.02 + obj.velocidade;
    } else {
      obj.posx -= 0.003 - obj.velocidade * 0.05;
      obj.posy -= 0.02 - obj.velocidade;
    }
    return obj;
  }

  defaultSettings() {
    tempoInicial = DateTime.now();
    tempoBarra = tempoInicial;
    roberto.posx = 0.0;
    roberto.posy = 1.0;
    roberto.velocidade = 0.0;
    roberto.direcao = "right";
    fruta1 = autoDefautLeft();
    fruta2 = autoDefautLeft();
    fruta3 = autoDefautLeft();
    fruta4 = autoDefautRight();
    fruta5 = autoDefautRight();
    fruta6 = autoDefautRight();
    colisao = false;
    // print(roberto);
    update();
  }

  String tempo() {
    if (!isPlay) return tempoFinal;
    var dif = DateTime.now().difference(tempoInicial);
    tempoFinal = "";
    // if (dif.inHours > 0) tempoString += "${dif.inHours} horas, ";
    // if (dif.inMinutes > 0) tempoString += "${dif.inMinutes} min ";
    tempoFinal += "${dif.inSeconds * 5} ";
    if (dif.inSeconds * 5 % 85 == 0 && dif.inSeconds != 0) {
      land = Random().nextInt(6);
      tempoBarra = DateTime.now();
    }
    return tempoFinal;
  }

  String tempoBarr() {
    if (!isPlay) return tempoBar;
    var dif = DateTime.now().difference(tempoBarra);
    tempoBar = "";
    tempoBar += "${dif.inSeconds * 5} ";
    return tempoBar;
  }

  ObjetoModel updateFrutaLeft(ObjetoModel obj) {
    if (obj.posy >= 1) obj.direcao = "up";
    if (obj.posy <= Random().nextDouble() - 2.5) obj.direcao = "down";
    if (obj.posx > 1.2) {
      obj = autoDefautLeft();
    }
    if (obj.direcao == "down") {
      obj.posx += 0.003 + obj.velocidade * 0.05;
      obj.posy += 0.02 + obj.velocidade;
    } else {
      obj.posx += 0.003 + obj.velocidade * 0.05;
      obj.posy -= 0.02 - obj.velocidade;
    }
    return obj;
  }

  pauseGame() {
    isPlay = !isPlay;
    if (!isPlay) {
      tempoPausado = DateTime.now();
    } else {
      var dif = DateTime.now().difference(tempoPausado);
      tempoInicial = tempoInicial.add(dif);
      tempoBarra = tempoBarra.add(dif);
    }
  }

  play() {
    isPlay = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (!colisao) {
        if (isPlay) {
          fruta1 = updateFrutaLeft(fruta1);
          fruta2 = updateFrutaLeft(fruta2);
          fruta3 = updateFrutaLeft(fruta3);
          fruta4 = updateFrutaRight(fruta4);
          fruta5 = updateFrutaRight(fruta5);
          fruta6 = updateFrutaRight(fruta6);
          colisao = isColisao(fruta1);
          colisao = isColisao(fruta2);
          colisao = isColisao(fruta3);
          colisao = isColisao(fruta4);
          colisao = isColisao(fruta5);
          colisao = isColisao(fruta6);
          // print(colisao);
          update();
        }
      } else {
        timer.cancel();
      }
    });
  }

  restart() {
    print("ENTROU NO RESTART");
    defaultSettings();
    if (!isPlay) play();
  }

  @override
  void onInit() {
    super.onInit();
    Wakelock.enabled;
    defaultSettings();

    if (!isPlay) play();
  }
}
