import '../../model/game_card.dart';
import '../effect/weapon_effect.dart';
import '../game_card_type.dart';

String _spritePath(String fileName) => 'assets/card_sprites/weapons/$fileName';

List<GameCard> _weaponGameCards = [
  GameCard(
    type: GameCardType.weapon,
    value: 2,
    effect: WarAxe(),
    asset: _spritePath('2.png'),
  ),
  GameCard(
    type: GameCardType.weapon,
    value: 3,
    effect: WarAxe(),
    asset: _spritePath('3.png'),
  ),
  GameCard(
    type: GameCardType.weapon,
    value: 4,
    effect: WarAxe(),
    asset: _spritePath('4.png'),
  ),
  GameCard(
    type: GameCardType.weapon,
    value: 5,
    effect: VampireMallet(),
    asset: _spritePath('5.png'),
  ),
  GameCard(
    type: GameCardType.weapon,
    value: 6,
    effect: VampireMallet(),
    asset: _spritePath('6.png'),
  ),
  GameCard(
    type: GameCardType.weapon,
    value: 7,
    effect: VampireMallet(),
    asset: _spritePath('7.png'),
  ),
  GameCard(
    type: GameCardType.weapon,
    value: 8,
    effect: VampireMallet(),
    asset: _spritePath('8.png'),
  ),
  GameCard(
    type: GameCardType.weapon,
    value: 9,
    effect: WarAxe(),
    asset: _spritePath('9.png'),
  ),
  GameCard(
    type: GameCardType.weapon,
    value: 10,
    effect: WarAxe(),
    asset: _spritePath('10.png'),
  ),
];

List<GameCard> get weaponGameCards => _weaponGameCards.toList();
