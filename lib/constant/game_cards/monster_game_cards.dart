import 'package:card_crawler/constant/effect/monster_effect.dart';
import 'package:card_crawler/model/game_card.dart';

import '../game_card_type.dart';

String _spritePath(String fileName) => 'assets/card_sprites/monsters/$fileName';

List<GameCard> _monsterGameCards = [
  GameCard(
    type: GameCardType.monster,
    value: 2,
    effect: Aftermath(),
    asset: _spritePath('2_1.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 2,
    effect: Aftermath(),
    asset: _spritePath('2_2.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 3,
    effect: Aftermath(),
    asset: _spritePath('3_1.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 3,
    effect: Aftermath(),
    asset: _spritePath('3_2.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 4,
    effect: Aftermath(),
    asset: _spritePath('4_1.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 4,
    effect: Aftermath(),
    asset: _spritePath('4_2.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 5,
    effect: Aftermath(),
    asset: _spritePath('5_1.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 5,
    effect: Aftermath(),
    asset: _spritePath('5_2.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 6,
    effect: Aftermath(),
    asset: _spritePath('6_1.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 6,
    effect: Aftermath(),
    asset: _spritePath('6_2.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 7,
    effect: Aftermath(),
    asset: _spritePath('7_1.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 7,
    effect: Aftermath(),
    asset: _spritePath('7_2.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 8,
    effect: Aftermath(),
    asset: _spritePath('8_1.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 8,
    effect: Aftermath(),
    asset: _spritePath('8_2.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 9,
    effect: Aftermath(),
    asset: _spritePath('9_1.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 9,
    effect: Aftermath(),
    asset: _spritePath('9_2.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 10,
    effect: Aftermath(),
    asset: _spritePath('10_1.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 10,
    effect: Aftermath(),
    asset: _spritePath('10_2.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 11,
    effect: Aftermath(),
    asset: _spritePath('11_1.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 11,
    effect: Aftermath(),
    asset: _spritePath('11_2.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 12,
    effect: Aftermath(),
    asset: _spritePath('12_1.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 12,
    effect: Aftermath(),
    asset: _spritePath('12_2.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 13,
    effect: Aftermath(),
    asset: _spritePath('13_1.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 13,
    effect: Aftermath(),
    asset: _spritePath('13_2.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 14,
    effect: Aftermath(),
    asset: _spritePath('14_1.png'),
  ),
  GameCard(
    type: GameCardType.monster,
    value: 14,
    effect: Aftermath(),
    asset: _spritePath('14_2.png'),
  ),
];

List<GameCard> get monsterGameCards => _monsterGameCards.toList();
