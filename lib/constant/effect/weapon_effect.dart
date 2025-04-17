import 'package:card_crawler/constant/game_card_type.dart';
import 'package:card_crawler/model/game_data.dart';

import 'effect.dart';

class VampireMallet extends OnUse{
  VampireMallet(): super('Vampire Mallet', 'Fighting an enemy will recover 1 HP');

  @override
  void trigger(GameData data) {
    data.health += 1;
  }
}

class ArtemisBow extends OnUse{
  ArtemisBow(): super('Artemis\'s Bow', 'This weapon\'s durability will always recover to full when used');

  @override
  void trigger(GameData data){
    data.durability = 14;
    }
}

class WarAxe extends OnUse{
  WarAxe(): super('War Axe', 'This weapon will deal more damage the lower it\'s durability is');

  @override
  void trigger(GameData data){
    if (data.durability < 9 && data.durability >= 6){
      data.buff = 3;
    } else if (data.durability < 6){
      data.buff = 5;
    }
  }
}

class IchorSickle extends OnUse{
  IchorSickle(): super('Ichor Sickle', 'This weapon will decrease the opponent ')
}