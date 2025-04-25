import 'package:card_crawler/provider/gameplay/type/game_card_type.dart';

import '../type/effect/effect.dart';

class GameCard {
  GameCard({
    required this.id,
    required this.type,
    required this.value,
    required this.effect,
    required this.asset,
  });

  int id;
  GameCardType type;
  int value;
  Effect effect;
  String asset;
}
