import 'package:card_crawler/constant/achievement.dart';
import 'package:card_crawler/constant/game_cards/accessory_game_cards.dart';
import 'package:card_crawler/constant/game_cards/game_cards.dart';
import 'package:card_crawler/constant/game_cards/weapon_game_cards.dart';
import 'package:card_crawler/model/game_card.dart';
import 'package:card_crawler/model/game_data.dart';
import 'package:card_crawler/model/user.dart';
import 'package:card_crawler/provider/gameplay/constant/card_location.dart';
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

  bool get canReplaceAcc => _data.canReplaceAcc;

  List<GameCard> get graveyard => _data.graveyard;

  (CardLocation?, int) _cardEffectDetailsToShow = (null, -1);

  (CardLocation?, int) get cardEffectDetailsToShow => _cardEffectDetailsToShow;

  int get round => _data.round;

  int get health => _data.health;

  int get durability => _data.durability;

  bool get canFlee => _data.canFlee;

  void init({required User user, required int level}) {
    _user = user;

    _state = Playing();
    _pendingStates.clear();

    _data = GameData(
      deck: gameCards..shuffle(),
      weapon: weaponGameCards.last,
      accessories: [accessoryGameCards.last],
      graveyard: gameCards.reversed.toList(),
    )..refillDungeonField();

    _resetCardView();

    notifyListeners();
  }

  void action(GameplayAction action) {
    _resetCardView();

    switch (action) {
      case SelectCardFromDungeonField(card: var card, index: var index):
        {
          _data.pickedCard = card;
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
      case TapCard(location: var location, index: var index):
        {
          _cardEffectDetailsToShow == (location, index)
              ? _cardEffectDetailsToShow = (null, -1)
              : _cardEffectDetailsToShow = (location, index);
        }
      case ShowGraveyard():
        {
          _queueState(GraveyardShown());
          _triggerPendingState();
        }
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

  void _resetCardView() {
    _cardEffectDetailsToShow = (null, -1);
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
