import '../../type/effect/weapon_effect.dart';
import '../../type/game_card_type.dart';
import '../../model/game_card.dart';

String _spritePath(String fileName) => 'assets/card_sprites/weapons/$fileName';

List<GameCard> weaponGameCards = [
  GameCard(
    id: 0,
    type: GameCardType.weapon,
    value: 2,
    effect: BlueStaff(),
    asset: _spritePath('2.png'),
  ),
  GameCard(
    id: 1,
    type: GameCardType.weapon,
    value: 3,
    effect: MirrorBolt(),
    asset: _spritePath('3.png'),
  ),
  GameCard(
    id: 2,
    type: GameCardType.weapon,
    value: 4,
    effect: ArtemisBow(),
    asset: _spritePath('4.png'),
  ),
  GameCard(
    id: 3,
    type: GameCardType.weapon,
    value: 5,
    effect: TenaciousMallet(),
    asset: _spritePath('5.png'),
  ),
  GameCard(
    id: 4,
    type: GameCardType.weapon,
    value: 15,
    effect: CursedAxe(),
    asset: _spritePath('6.png'),
  ),
  GameCard(
    id: 5,
    type: GameCardType.weapon,
    value: 7,
    effect: IchorSickle(),
    asset: _spritePath('7.png'),
  ),
  GameCard(
    id: 6,
    type: GameCardType.weapon,
    value: 8,
    effect: HolyHammer(),
    asset: _spritePath('8.png'),
  ),
  GameCard(
    id: 7,
    type: GameCardType.weapon,
    value: 9,
    effect: WarAxe(),
    asset: _spritePath('9.png'),
  ),
  GameCard(
    id: 8,
    type: GameCardType.weapon,
    value: 10,
    effect: BloodlustBlade(),
    asset: _spritePath('10.png'),
  ),
];
