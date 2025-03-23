import '../../model/game_card.dart';
import '../effect/weapon_effect.dart';
import '../game_card_type.dart';

String _spritePath(String fileName) => 'assets/card_sprites/consumables/$fileName';

List<GameCard> _consumableGameCards = [
  GameCard(
    type: GameCardType.consumable,
    value: 2,
    effect: VampireMallet(),
    asset: _spritePath('2.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 3,
    effect: VampireMallet(),
    asset: _spritePath('3.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 4,
    effect: VampireMallet(),
    asset: _spritePath('4.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 5,
    effect: VampireMallet(),
    asset: _spritePath('5.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 6,
    effect: VampireMallet(),
    asset: _spritePath('6.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 7,
    effect: VampireMallet(),
    asset: _spritePath('7.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 8,
    effect: VampireMallet(),
    asset: _spritePath('8.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 9,
    effect: VampireMallet(),
    asset: _spritePath('9.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 10,
    effect: VampireMallet(),
    asset: _spritePath('10.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 11,
    effect: VampireMallet(),
    asset: _spritePath('11.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 12,
    effect: VampireMallet(),
    asset: _spritePath('12.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 13,
    effect: VampireMallet(),
    asset: _spritePath('13.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 14,
    effect: VampireMallet(),
    asset: _spritePath('14.png'),
  ),
];

List<GameCard> get consumableGameCards => _consumableGameCards.toList();
