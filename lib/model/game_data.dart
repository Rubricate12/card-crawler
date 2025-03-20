import 'package:card_crawler/model/game_card.dart';

class GameData {
  List<GameCard> deck = List.empty(growable: true);
  List<GameCard?> dungeonField = List.filled(4, null);
  List<GameCard> graveyard = List.empty(growable: true);
  List<GameCard> accessories = List.empty(growable: true);
  GameCard? weapon;
  GameCard? pickedCard;
  int level = 1;
  int health = 20;
  int durability = 0;
  int round = 1;
  int buff = 0;
  int multiplier = 1;
  bool canReplaceAcc = false;
  bool hasHealed = false;
  bool canFlee = true;
}
