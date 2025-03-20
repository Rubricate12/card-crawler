import 'dart:math';

import 'package:card_crawler/provider/gameplay/gameplay_state.dart';
import 'package:card_crawler/provider/gameplay/ui_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:playing_cards/playing_cards.dart';

import 'gameplay_action.dart';

class GameplayProvider extends ChangeNotifier {
  GameplayState _state = Playing();
  GameplayState get state => _state;

  int _health = 20;
  int get health => _health;

  final List<PlayingCard> _deck = List.empty(growable: true);
  List<PlayingCard> get deck => _deck;

  final List<PlayingCard?> _field0 = List.filled(4, null);
  List<PlayingCard?> get field0 => _field0;

  final List<PlayingCard> _field1 = List.empty(growable: true);
  List<PlayingCard> get field1 => _field1;

  PlayingCard? _graveyard;
  PlayingCard? get graveyard => _graveyard;

  bool _canFlee = true;
  bool get canFlee => _canFlee;

  void init() {
    _state = Playing();

    _health = 20;

    _deck.clear();
    _deck.addAll(standardFiftyTwoCardDeck());
    _deck.shuffle(Random());

    _clearField0();
    _refillField0();

    _field1.clear();

    _graveyard = null;

    _canFlee = true;

    notifyListeners();
  }

  void action(GameplayAction action) {
    switch (action) {
      case SelectCardFromField0(card: var card, index: var index):
        {
          _removeCardFromField0(index);

          if (1 < _field1.length) _graveyard = _field1.removeLast();

          _field1.add(card);

          if (_isField0Low()) _refillField0();

          if (_isFinished()) _state = Finished(isWin: true);
        }
      case Flee():
        {
          _canFlee = false;
          _state = Finished(isWin: false);
        }
    }

    notifyListeners();
  }

  void _removeCardFromField0(int index) {
    _field0[index] = null;
  }

  bool _isField0Low() {
    return _field0.where((card) => card != null).length == 1;
  }

  void _refillField0() {
    for (int i = 0; i < _field0.length; i++) {
      if (_deck.isNotEmpty) {
        int index = _field0.indexOf(null);
        if (index != -1) _field0[index] = deck.removeLast();
      }
    }
  }

  void _clearField0() {
    for (int i = 0; i < _field0.length; i++) {
      _field0[i] = null;
    }
  }

  bool _isFinished() {
    return _deck.isEmpty && _field0.every((card) => card == null);
  }

  void uiAction(UiAction action) {
    switch (action) {
      case Pause():
        _state = Paused();
      case DismissDialog():
        _state = Playing();
    }

    notifyListeners();
  }
}
