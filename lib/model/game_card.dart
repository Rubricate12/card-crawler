import 'package:card_crawler/constant/game_card_type.dart';
import 'package:card_crawler/constant/effect/effect.dart';

class GameCard {
  GameCard({
    required this.type,
    required this.value,
    required this.effect,
    required this.asset,
  });

  GameCardType type;
  int value;
  Effect effect;
  String asset;
}
