import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_flutter/core/const.dart';

import 'package:game_flutter/core/services.dart';
import 'package:game_flutter/game/model/logger.dart';
import 'package:game_flutter/home/models/hero.dart';
import 'package:game_flutter/home/models/selected_status.dart';



class HeroNotifier extends StateNotifier<List<Hero>> {
  HeroNotifier(): super(
    getListOfHeroes()
  );

  void toggle(String heroId) {
    state = [
      for (final hero in state)
        if (hero.id == heroId)
          hero.copyWith(selected: !hero.selected)
        else
          hero,
    ];
  }
}

final heroProvider = StateNotifierProvider<HeroNotifier, List<Hero>>((ref) {
  return HeroNotifier();
});


class SelectedNotifier extends StateNotifier<SelectedStatus> {
  SelectedNotifier(): super(
      SelectedStatus(selected: false, type:  TypeOfHero.knight)
  );

  void toggle(TypeOfHero typeOfHero) {

    state = state.copyWith(selected: !state.selected, type: typeOfHero);

  }
}

final selectedStatusProvider = StateNotifierProvider<SelectedNotifier, SelectedStatus>((ref) {
  return SelectedNotifier();
});


