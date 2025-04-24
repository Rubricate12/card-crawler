import 'package:card_crawler/provider/gameplay/constant/game_cards/weapon_game_cards.dart';

import '../../model/game_card.dart';
import 'accessory_game_cards.dart';
import 'consumable_game_cards.dart';
import 'monster_game_cards.dart';

List<GameCard> _gameCards =
    List.empty(growable: true)
      ..addAll(weaponGameCards)
      ..addAll(accessoryGameCards)
      ..addAll(consumableGameCards)
      ..addAll(monsterGameCards);

List<GameCard> get gameCards => _gameCards.toList();
