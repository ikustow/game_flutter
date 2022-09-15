import 'package:game_flutter/core/const.dart';
import 'package:game_flutter/get/home/models/get_hero.dart';
import 'package:get/get.dart';

class GetXHeroController extends GetxController {

var knight = GetXHero('Knight', '1',TypeOfHero.knight).obs;
var wizard = GetXHero('Wizard', '2',TypeOfHero.wizard).obs;


@override
void onInit() {
  super.onInit();
  createHeroes();
}

void createHeroes(){
  knight = GetXHero('Knight', '1',TypeOfHero.knight).obs;
  wizard = GetXHero('Wizard', '2',TypeOfHero.wizard).obs;
}

@override
void onClose() {

  super.onClose();
}

void selectKnight(){
  knight.value.selected.value = true;
  wizard.value.selected.value = false;
}

void selectWizard(){
  wizard.value.selected.value = true;
  knight.value.selected.value = false;
}
}