import 'package:card_crawler/constant/card_type.dart';
import 'package:card_crawler/constant/effect/effect.dart';

class Card {
  Card({
    required this.type,
    required this.value,
    required this.effect,
    required this.asset,
  });

  CardType type;
  int value;
  Effect effect;
  String asset;
}
