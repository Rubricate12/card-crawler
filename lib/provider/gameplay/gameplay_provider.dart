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
  int _turn = 1;
  int get turn => _turn;

  int _weapon = 0;
  int _durability = 0;
  bool _hasHealed = false;

  final List<PlayingCard> _deck = List.empty(growable: true);
  List<PlayingCard> get deck => _deck;

  final List<PlayingCard?> _field0 = List.filled(4, null);
  List<PlayingCard?> get field0 => _field0;

  final List<PlayingCard> _field1 = List.empty(growable: true);
  List<PlayingCard> get field1 => _field1;

  List<PlayingCard> _graveyard = List.empty(growable: true);
  List<PlayingCard> get graveyard => _graveyard;

  bool _canFlee = true;
  bool get canFlee => _canFlee;

  void init() {
    _state = Playing();

    _health = 20;
    _weapon = 0;
    _durability = 0;
    _turn = 1;
    _hasHealed = false;

    _deck.clear();
    _deck.addAll(standardFiftyTwoCardDeck());
    _deck.shuffle(Random());

    _clearField0();
    _refillField0();

    _field1.clear();

    _graveyard.clear();

    _canFlee = true;

    notifyListeners();
  }

  void action(GameplayAction action) {
    switch (action) {
      case SelectCardFromField0(card: var card, index: var index):
        {
          var suit = card.suit;
          var value = card.value.index + 2;

          switch (suit) {
            case Suit.hearts:
              {
                if (!_hasHealed) {
                  _health += value;
                  if (_health > 20) {
                    _health = 20;
                  }
                  _hasHealed = true;
                }
                _graveyard.add(card);
              }
            case Suit.diamonds:
              {
                if (_field1.isNotEmpty) {
                  for (var field1Card in _field1) {
                    _graveyard.add(field1Card);
                  }
                  _field1.clear();
                }
                _weapon = value;
                _durability = 14;
                _field1.add(card);
              }
            default:
              {
                switch (_field1.length) {
                  case 0:
                    {
                      _health -= value;
                      _graveyard.add(card);
                    }
                  case 1:
                    {
                      if (value > _weapon) {
                        _health -= (value - _weapon);
                      }
                      _field1.add(card);
                      _durability = value;
                    }
                  case 2:
                    {
                      if (_durability > value) {
                        var damage = (value - _weapon);
                        damage = (damage < 0) ? 0 : damage;
                        _health -= damage;
                        _graveyard.add(_field1.removeLast());
                        _field1.add(card);
                        _durability = value;
                      } else {
                        _health -= value;
                        _graveyard.add(card);
                      }
                    }
                }
                if (_health < 0) _health = 0;
              }
          }
          _removeCardFromField0(index);

          if (_isField0Low()) {
            _refillField0();
            _turn++;
            _hasHealed = false;
            _canFlee = true;
          }

          _checkWin();
        }
      case Flee():
        {
          List<PlayingCard> fledCard = List.empty(growable: true);
          for (var field0Card in _field0) {
            if (field0Card != null) fledCard.add(field0Card);
          }
          _clearField0();
          fledCard.shuffle(Random());
          _deck.insertAll(0, fledCard);
          _canFlee = false;
          _refillField0();
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

  void _checkWin() {
    if (_deck.isEmpty && _field0.every((card) => card == null) && _health > 0) {
      _state = Finished(isWin: true);
    } else if (_health <= 0) {
      _state = Finished(isWin: false);
    }
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
