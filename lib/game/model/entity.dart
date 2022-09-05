import 'package:game_flutter/core/const.dart';

class Entity {
  final int health;
  final int power;
  final AttackArea attackArea;
  final DefenseArea defenseArea;

  Entity(
      {required this.attackArea,
      required this.defenseArea,
      required this.health,
      required this.power});

  Entity copyWith(
      {int? health,
      int? power,
      AttackArea? attackArea,
      DefenseArea? defenseArea}) {
    return Entity(
      health: health ?? this.health,
      power: power ?? this.power,
      attackArea: attackArea ?? this.attackArea,
      defenseArea: defenseArea ?? this.defenseArea,
    );
  }
}
