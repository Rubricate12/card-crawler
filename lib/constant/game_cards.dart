import 'package:card_crawler/constant/effect/monster_effect.dart';
import 'package:card_crawler/constant/game_card_type.dart';
import 'package:card_crawler/model/game_card.dart';

String _iconBasePath = 'assets/card_icons/';
String _spriteBasePath = 'assets/card_sprites/';

List<GameCard> gameCards = [
  GameCard(type: GameCardType.monster, value: 1, effect: AntiHeal(), iconAsset: '$_iconBasePath/monster.png', spriteAsset: '$_spriteBasePath/monster_dr_bryan.png'),
  GameCard(type: GameCardType.monster, value: 2, effect: AntiHeal(), iconAsset: '$_iconBasePath/monster.png', spriteAsset: '$_spriteBasePath/monster_meanuncleace.png')
];