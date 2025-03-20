import 'package:card_crawler/constant/effect/effect.dart';
import 'package:card_crawler/constant/game_cards.dart';
import 'package:card_crawler/model/game_data.dart';
import 'package:card_crawler/model/user.dart';
import 'package:card_crawler/provider/gameplay/gameplay_state.dart';
import 'package:card_crawler/provider/gameplay/ui_action.dart';
import 'package:flutter/cupertino.dart';

import 'gameplay_action.dart';

class Test extends Effect {
  Test() : super('Tes', '');

  @override
  void trigger(GameData data) {}
}

class GameplayProvider extends ChangeNotifier {
  User _user = User();

  GameplayState _state = Playing();

  GameplayState get state => _state;

  GameData _data = GameData();
  GameData get data => _data;

  void init({required User user, required int level}) {
    _user = user;
    _state = Playing();
    _data = GameData();
    _data.deck.addAll(gameCards);
    _data.dungeonField[0] = _data.deck.removeLast();
    _data.dungeonField[1] = _data.deck.removeLast();
    notifyListeners();
  }

  void action(GameplayAction action) {
    switch (action) {
      case SelectCardFromDungeonField(card: var card, index: var index):
        {}
      case SelectCardFromAccessories(card: var card):
        {}
      case Flee():
        {}
    }

    notifyListeners();
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
