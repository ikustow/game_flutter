import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_flutter/core/const.dart';
import 'package:game_flutter/core/services.dart';
import 'package:game_flutter/game/model/entity.dart';

import '../model/logger.dart';

class PlayerNotifier extends StateNotifier<Entity> {
  PlayerNotifier(): super(
    getPlayer()
  );

  void action(int powerValue, LoggerNotifier aaa) {
    aaa.add('12');
    state = state.copyWith(health: state.health - powerValue);
  }

  void setDefense(DefenseArea defenseArea) {
    state = state.copyWith(defenseArea: defenseArea);
  }
}

final playerProvider = StateNotifierProvider<PlayerNotifier, Entity>((ref) {
  return PlayerNotifier();
});

class EnemyNotifier extends StateNotifier<Entity> {
  EnemyNotifier(): super(
   getEnemy()
  );

  void action(int powerValue) {

    state = state.copyWith(health: state.health - powerValue);
  }
}

final enemyProvider = StateNotifierProvider<EnemyNotifier, Entity>((ref) {
  return EnemyNotifier();
});

class LoggerNotifier extends StateNotifier<List<Logger>> {
  LoggerNotifier([List<Logger>? initialLogs]) : super(initialLogs ?? []);

  void add(String description) {
    state = [
      ...state,
      Logger(
       event: description
      ),
    ];
  }

}

final loggerProvider = StateNotifierProvider<LoggerNotifier, List<Logger>>((ref) {
  return LoggerNotifier();
});