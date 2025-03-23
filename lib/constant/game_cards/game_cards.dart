import 'package:card_crawler/constant/game_cards/consumable_game_cards.dart';
import 'package:card_crawler/constant/game_cards/monster_game_cards.dart';
import 'package:card_crawler/constant/game_cards/weapon_game_cards.dart';
import 'package:card_crawler/model/game_card.dart';

import 'accessory_game_cards.dart';

List<GameCard> _gameCards =
    List.empty(growable: true)
      ..addAll(weaponGameCards)
      ..addAll(accessoryGameCards)
      ..addAll(consumableGameCards)
      ..addAll(monsterGameCards);

List<GameCard> get gameCards => _gameCards.toList();
