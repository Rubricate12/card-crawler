import 'package:card_crawler/provider/gameplay/type/effect/accessory_effect.dart';
import 'package:card_crawler/provider/gameplay/type/game_card_type.dart';
import 'package:card_crawler/provider/gameplay/model/game_card.dart';

String _spritePath(String fileName) =>
    'assets/card_sprites/accessories/$fileName';

List<GameCard> accessoryGameCards = [
  GameCard(
    id: 9,
    type: GameCardType.accessory,
    value: 0,
    effect: SpectreBoots(),
    asset: _spritePath('a.png'),
  ),
  GameCard(
    id: 10,
    type: GameCardType.accessory,
    value: 0,
    effect: PowerBreastplate(),
    asset: _spritePath('b.png'),
  ),
  GameCard(
    id: 11,
    type: GameCardType.accessory,
    value: 0,
    effect: CommanderHelmet(),
    asset: _spritePath('c.png'),
  ),
  GameCard(
    id: 12,
    type: GameCardType.accessory,
    value: 0,
    effect: RingOfMending(),
    asset: _spritePath('d.png'),
  ),
  GameCard(
    id: 13,
    type: GameCardType.accessory,
    value: 0,
    effect: HealingAmulet(),
    asset: _spritePath('e.png'),
  ),
  GameCard(
    id: 14,
    type: GameCardType.accessory,
    value: 0,
    effect: HeroCape(),
    asset: _spritePath('f.png'),
  ),
  GameCard(
    id: 15,
    type: GameCardType.accessory,
    value: 0,
    effect: EmperorCrown(),
    asset: _spritePath('g.png'),
  ),
];
