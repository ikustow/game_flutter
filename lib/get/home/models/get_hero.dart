import 'package:game_flutter/core/const.dart';
import 'package:get/state_manager.dart';

class GetXHero {
  GetXHero(this.description,  this.id, this.type,);

  final String id;
  final String description;
  final TypeOfHero? type;
  final selected = false.obs;



  /*GetXHero copyWith({String? id, String? description, bool? selected, TypeOfHero? type}) {
    return GetXHero(
      id: id ?? this.id,
      description: description ?? this.description,
      selected: selected ?? this.selected,
      type: type ?? this.type,
    );
  }*/
}

