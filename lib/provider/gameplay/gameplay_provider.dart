import 'package:card_crawler/constant/achievement.dart';
import 'package:card_crawler/constant/game_cards/game_cards.dart';
import 'package:card_crawler/model/game_card.dart';
import 'package:card_crawler/model/game_data.dart';
import 'package:card_crawler/model/user.dart';
import 'package:card_crawler/provider/gameplay/gameplay_state.dart';
import 'package:card_crawler/provider/gameplay/ui_action.dart';
import 'package:flutter/cupertino.dart';

import 'gameplay_action.dart';

class GameplayProvider extends ChangeNotifier {
  User _user = User();

  GameplayState _state = Playing();

  GameplayState get state => _state;

  final List<GameplayState> _pendingStates = List.empty(growable: true);

  GameData _data = GameData();

  List<GameCard> get deck => _data.deck;

  List<GameCard?> get dungeonField => _data.dungeonField;

  GameCard? get weapon => _data.weapon;

  List<GameCard> get accessories => _data.accessories;

  List<GameCard> get graveyard => _data.graveyard;

  int get round => _data.round;

  int get health => _data.health;

  int get durability => _data.durability;

  bool get canFlee => _data.canFlee;

  void init({required User user, required int level}) {
    _user = user;

    _state = Playing();
    _pendingStates.clear();

    _data = GameData(deck: gameCards.toList());
    _data.deck.shuffle();
    _data.refillDungeonField();

    notifyListeners();
  }

  void action(GameplayAction action) {
    switch (action) {
      case SelectCardFromDungeonField(card: var card, index: var index):
        {
          _queueState(EffectTriggered(card: card));
          card.effect.trigger(_data);
          _queueState(
            AchievementUnlocked(achievement: Achievement.dungeonCrawlerI),
          );
          _queueState(
            AchievementUnlocked(achievement: Achievement.dungeonCrawlerII),
          );
          _queueState(
            AchievementUnlocked(achievement: Achievement.fourOfAKind),
          );
          _queueState(Finished(isWin: true));
          _triggerPendingState();
        }
      case SelectCardFromAccessories(card: var card, index: var index):
        {}
      case Flee():
        {}
    }

    notifyListeners();
  }

  void uiAction(UiAction action) {
    switch (action) {
      case Pause():
        {
          _queueState(Paused());
          _triggerPendingState();
        }
      case DismissDialog():
        _triggerPendingState();
    }

    notifyListeners();
  }

  void _queueState(GameplayState state) {
    _pendingStates.add(state);
  }

  void _triggerPendingState() {
    var nextState =
        (_pendingStates.isNotEmpty) ? _pendingStates.removeAt(0) : null;
    _state = nextState ?? Playing();
  }
}
