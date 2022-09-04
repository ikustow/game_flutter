
import 'package:game_flutter/core/const.dart';
import 'package:game_flutter/home/models/hero.dart';


List<Hero> getListOfHeroes (){
  final List<Hero> listOfHeroes = [];
  const knight = Hero(description: 'Knight', id: '1', selected: false, type: TypeOfHero.knight);
  const wizard = Hero(description: 'Wizard', id: '2', selected: false, type: TypeOfHero.wizard);
  listOfHeroes.add(knight);
  listOfHeroes.add(wizard);
  return listOfHeroes;
}