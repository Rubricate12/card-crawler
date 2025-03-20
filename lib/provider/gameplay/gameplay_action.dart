import '../../model/game_card.dart';

sealed class GameplayAction {}

class SelectCardFromField0 extends GameplayAction {
  SelectCardFromField0({required this.card, required this.index});

  final GameCard card;
  final int index;
}

class Flee extends GameplayAction {}
