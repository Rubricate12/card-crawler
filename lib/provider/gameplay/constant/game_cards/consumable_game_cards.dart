import '../../type/effect/consumable_effect.dart';
import '../../type/effect/weapon_effect.dart';
import '../../type/game_card_type.dart';
import '../../model/game_card.dart';

String _spritePath(String fileName) =>
    'assets/card_sprites/consumables/$fileName';

List<GameCard> consumableGameCards = [
  GameCard(
    id: 16,
    type: GameCardType.consumable,
    value: 0,
    effect: BloodthornBrew(),
    asset: _spritePath('2.png'),
  ),
  GameCard(
    id: 17,
    type: GameCardType.consumable,
    value: 8,
    effect: TitansShroom(),
    asset: _spritePath('2.png'),
  ),
  GameCard(
    id: 18,
    type: GameCardType.consumable,
    value: 8,
    effect: TemporalDew(),
    asset: _spritePath('5.png'),
  ),
  GameCard(
    id: 19,
    type: GameCardType.consumable,
    value: 8,
    effect: EmeticElixir(),
    asset: _spritePath('6.png'),
  ),
  GameCard(
    id: 20,
    type: GameCardType.consumable,
    value: 9,
    effect: BolterPotion(),
    asset: _spritePath('5.png'),
  ),
  GameCard(
    id: 21,
    type: GameCardType.consumable,
    value: 9,
    effect: AgedBerries(),
    asset: _spritePath('3.png'),
  ),
  GameCard(
    id: 22,
    type: GameCardType.consumable,
    value: 10,
    effect: VolatileElixir(),
    asset: _spritePath('8.png'),
  ),
];
