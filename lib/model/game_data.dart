import 'package:card_crawler/model/game_card.dart';

class GameData {
  GameData({
    this.deck = const [],
    this.dungeonField = const [],
    this.graveyard = const [],
    this.accessories = const [],
    this.weapon,
    this.pickedCard,
    this.level = 1,
    this.health = 20,
    this.durability = 0,
    this.turn = 1,
    this.buff = 0,
    this.multiplier = 1,
    this.canReplaceAcc = false,
    this.hasHealed = false,
    this.canFlee = true
  });

  List<GameCard> deck;
  List<GameCard> dungeonField;
  List<GameCard> graveyard;
  List<GameCard> accessories;
  GameCard? weapon;
  GameCard? pickedCard;
  int level;
  int health;
  int durability;
  int turn;
  int buff;
  int multiplier;
  bool canReplaceAcc;
  bool hasHealed;
  bool canFlee;
}
