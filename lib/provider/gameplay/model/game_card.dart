import 'package:card_crawler/provider/gameplay/type/game_card_type.dart';

import '../type/effect/effect.dart';

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
