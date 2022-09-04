

import 'package:game_flutter/core/const.dart';

class Hero {
  const Hero({required this.type, required this.id, required this.description, required this.selected});

  final String id;
  final String description;
  final TypeOfHero type;
  final bool selected;



  Hero copyWith({String? id, String? description, bool? selected, TypeOfHero? type}) {
    return Hero(
      id: id ?? this.id,
      description: description ?? this.description,
      selected: selected ?? this.selected,
      type: type ?? this.type,
    );
  }
}