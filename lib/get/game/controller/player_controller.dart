import 'package:game_flutter/core/const.dart';
import 'package:game_flutter/get/game/model/getx_entity.dart';
import 'package:get/get.dart';

class PlayerController extends GetxController {

  var player =  GetXEntity().obs;


  void setDefense(DefenseArea defenseArea) {
    player.value.defenseArea.value = defenseArea ;
  }

  void setAttack(AttackArea attackArea) {
    player.value.attackArea.value = attackArea ;
  }

  void action(int powerValue) {
    player.value.health = player.value.health- powerValue;
  }
}