import '../../model/game_card.dart';

sealed class GameplayAction {}

class SelectCardFromDungeonField extends GameplayAction {
  SelectCardFromDungeonField({required this.card, required this.index});

  final GameCard card;
  final int index;
}

class SelectCardFromAccessories extends GameplayAction {
  SelectCardFromAccessories({required this.card, required this.index});

  final GameCard card;
  final int index;
}

class Flee extends GameplayAction {}
