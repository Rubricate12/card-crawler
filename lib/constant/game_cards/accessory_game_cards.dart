import 'package:card_crawler/constant/effect/weapon_effect.dart';
import 'package:card_crawler/constant/game_card_type.dart';
import 'package:card_crawler/model/game_card.dart';

String _spritePath(String fileName) =>
    'assets/card_sprites/accessories/$fileName';

List<GameCard> _accessoryGameCards = [
  GameCard(
    type: GameCardType.accessory,
    value: 0,
    effect: VampireMallet(),
    asset: _spritePath('a.png'),
  ),
  GameCard(
    type: GameCardType.accessory,
    value: 0,
    effect: VampireMallet(),
    asset: _spritePath('b.png'),
  ),
  GameCard(
    type: GameCardType.accessory,
    value: 0,
    effect: VampireMallet(),
    asset: _spritePath('c.png'),
  ),
  GameCard(
    type: GameCardType.accessory,
    value: 0,
    effect: VampireMallet(),
    asset: _spritePath('d.png'),
  ),
  GameCard(
    type: GameCardType.accessory,
    value: 0,
    effect: VampireMallet(),
    asset: _spritePath('e.png'),
  ),
  GameCard(
    type: GameCardType.accessory,
    value: 0,
    effect: VampireMallet(),
    asset: _spritePath('f.png'),
  ),
  GameCard(
    type: GameCardType.accessory,
    value: 0,
    effect: VampireMallet(),
    asset: _spritePath('g.png'),
  ),
];

List<GameCard> get accessoryGameCards => _accessoryGameCards.toList();
