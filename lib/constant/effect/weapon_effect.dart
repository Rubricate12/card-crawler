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