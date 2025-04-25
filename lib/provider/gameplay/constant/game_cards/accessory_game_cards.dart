import 'package:card_crawler/provider/gameplay/type/game_card_type.dart';
import 'package:card_crawler/provider/gameplay/model/game_card.dart';

import '../../type/effect/weapon_effect.dart';

String _spritePath(String fileName) =>
    'assets/card_sprites/accessories/$fileName';

List<GameCard> _accessoryGameCards = [
  GameCard(
    id: 9,
    type: GameCardType.accessory,
    value: 0,
    effect: VampireMallet(),
    asset: _spritePath('a.png'),
  ),
  GameCard(
    id: 10,
    type: GameCardType.accessory,
    value: 0,
    effect: VampireMallet(),
    asset: _spritePath('b.png'),
  ),
  GameCard(
    id: 11,
    type: GameCardType.accessory,
    value: 0,
    effect: VampireMallet(),
    asset: _spritePath('c.png'),
  ),
  GameCard(
    id: 12,
    type: GameCardType.accessory,
    value: 0,
    effect: VampireMallet(),
    asset: _spritePath('d.png'),
  ),
  GameCard(
    id: 13,
    type: GameCardType.accessory,
    value: 0,
    effect: VampireMallet(),
    asset: _spritePath('e.png'),
  ),
  GameCard(
    id: 14,
    type: GameCardType.accessory,
    value: 0,
    effect: VampireMallet(),
    asset: _spritePath('f.png'),
  ),
  GameCard(
    id: 15,
    type: GameCardType.accessory,
    value: 0,
    effect: VampireMallet(),
    asset: _spritePath('g.png'),
  ),
];

List<GameCard> get accessoryGameCards => _accessoryGameCards.toList();
