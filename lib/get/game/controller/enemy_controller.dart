import 'package:game_flutter/core/const.dart';
import 'package:game_flutter/get/game/model/getx_entity.dart';
import 'package:get/get.dart';

class EnemyController extends GetxController {

  var enemy = GetXEntity().obs;

  void setDefense(DefenseArea defenseArea) {
    enemy.value.defenseArea.value = defenseArea ;
  }

  void setAttack(AttackArea attackArea) {
    enemy.value.attackArea.value = attackArea ;
  }
  void action(int powerValue) {
    enemy.value.health = enemy.value.health- powerValue;
  }
}