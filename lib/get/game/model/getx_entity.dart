import 'package:game_flutter/core/const.dart';
import 'package:get/get.dart';

class GetXEntity {

  GetXEntity();

  var  health = 100.obs;
  var  power = 20.obs;
  var  attackArea = AttackArea.top.obs;
  var  defenseArea = DefenseArea.top.obs;

}
