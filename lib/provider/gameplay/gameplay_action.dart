import 'package:playing_cards/playing_cards.dart';

sealed class GameplayAction {}

class SelectCardFromField0 extends GameplayAction {
  SelectCardFromField0({required this.card, required this.index});

  final PlayingCard card;
  final int index;
}

class Flee extends GameplayAction {}
