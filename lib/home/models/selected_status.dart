import 'package:game_flutter/core/const.dart';

class SelectedStatus {

  final TypeOfHero type;
  final bool selected;

  SelectedStatus({required this.type, required this.selected});



  SelectedStatus copyWith({ bool? selected, TypeOfHero? type}) {
    return SelectedStatus(
      selected: selected ?? this.selected,
      type: type ?? this.type,
    );
  }
}