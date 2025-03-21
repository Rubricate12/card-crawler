import 'package:card_crawler/constant/effect/weapon_effect.dart';
import 'package:card_crawler/constant/game_card_type.dart';
import 'package:card_crawler/model/game_card.dart';

String _spritePath(String fileName) =>
    'assets/card_sprites/accessories/$fileName';

List<GameCard> _accessoryGameCards = [
  GameCard(
    type: GameCardType.accessory,
    value: 2,
    effect: VampireMallet(),
    asset: _spritePath('2.png'),
  ),
  GameCard(
    type: GameCardType.accessory,
    value: 3,
    effect: VampireMallet(),
    asset: _spritePath('3.png'),
  ),
  GameCard(
    type: GameCardType.accessory,
    value: 4,
    effect: VampireMallet(),
    asset: _spritePath('4.png'),
  ),
  GameCard(
    type: GameCardType.accessory,
    value: 5,
    effect: VampireMallet(),
    asset: _spritePath('5.png'),
  ),
  GameCard(
    type: GameCardType.accessory,
    value: 6,
    effect: VampireMallet(),
    asset: _spritePath('6.png'),
  ),
  GameCard(
    type: GameCardType.accessory,
    value: 7,
    effect: VampireMallet(),
    asset: _spritePath('7.png'),
  ),
];

List<GameCard> get accessoryGameCards => _accessoryGameCards.toList();
