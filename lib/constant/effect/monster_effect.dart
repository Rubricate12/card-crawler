import 'package:card_crawler/constant/game_card_type.dart';
import 'package:card_crawler/model/game_data.dart';

import 'effect.dart';

class NoEscape extends OnField {
  NoEscape(): super('No Escape', 'As long as this card is on a dungeon field, you can\'t flee.');

  @override
  void trigger(GameData data) {
    data.canFlee = false;
  }
}

class Scaling extends OnPicked {
  Scaling(): super('Scaling', 'This card\'s strength will increase by 1 for every round that have been played.');

  @override
  void trigger(GameData data) {
    data.buff = data.round;
  }
}

class Spiky extends OnPicked {
  Spiky(): super('Poisonous', 'Fighting this monster will lose you 3 health.');

  @override
  void trigger(GameData data) {
    data.health -= 3;
  }
}

class AntiHeal extends OnKill {
  AntiHeal(): super('Anti Heal', 'After defeating this enemy, healing potion won\'t heal you until the start of next turn.');

  @override
  void trigger(GameData data) {
    data.hasHealed = true;
  }
}

class Corrosive extends OnPicked {
  Corrosive(): super('Corrosive', 'Fighting this monster will lose you 3 durability.');

  @override
  void trigger(GameData data) {
    data.durability -=3;
  }
}

class Ally extends OnKill{
  Ally(): super('Ally', 'After defeating this enemy, this enemy will act as your weapon.');

  @override
  void trigger(GameData data) {
    var newWeapon = data.graveyard.removeLast();
    if (data.weapon != null) data.graveyard.add(data.weapon!);
    data.weapon = newWeapon;
  }
}

class Wrecker extends OnKill{
  Wrecker(): super('Wrecker', 'After defeating this enemy, your weapon will break.');

  @override
  void trigger(GameData data) {
    if (data.weapon != null) data.graveyard.add(data.weapon!);
  }
}

class Sticky extends OnPicked{
  Sticky(): super('Sticky', 'Fighting this monster will make you unable to flee for the rest of this turn.');

  @override
  void trigger(GameData data) {
    data.canFlee = false;
  }
}

class Poisonous extends OnField{
  Poisonous(): super('Poisonous', 'As long as this card is on a dungeon field, you will take 1 damage each turn.');

  @override
  void trigger(GameData data) {
    data.health -= 1;
  }
}

class Opportunist extends OnPicked{
  Opportunist(): super('Opportunist', 'This monster will be 5 points stronger if you don\'t have a weapon.');

  @override
  void trigger(GameData data) {
    data.buff = 5;
  }
}

class Mimic extends OnPicked{
  Mimic(): super('Mimic', 'This monster\'s power will mimic the power of your weapon.');

  @override
  void trigger(GameData data) {
    if (data.pickedCard != null && data.weapon !=null) {
      data.pickedCard!.value = data.weapon!.value;
    } else {
      data.pickedCard!.value = 0;
    }
  }
}

class Aftermath extends OnKill{
  Aftermath(): super ('Aftermath', 'After killing this enemy, you will take 0.5x of this monster\'s power as damage.');

  @override
  void trigger(GameData data) {
    data.health -= (data.pickedCard!.value / 2).toInt();
  }
}

class Vengeful extends OnPicked {
  Vengeful() : super ('Vengeful', 'This enemy gains the power of the last monster you killed.');

  @override
  void trigger(GameData data) {
    var firstMonster = data.graveyard.lastWhere((card) => card.type == GameCardType.monster);
    data.buff = firstMonster.value;
  }
}