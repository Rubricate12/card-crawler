import 'package:card_crawler/provider/gameplay/model/game_card.dart';

import 'achievement.dart';

sealed class GameplayState {}

class Playing extends GameplayState {}

class ReplacingAccessory extends GameplayState {}

class EffectTriggered extends GameplayState {
  EffectTriggered({required this.card});

  final GameCard card;
}

class GraveyardShown extends GameplayState {}

class Finished extends GameplayState {
  Finished({required this.isWin});

  final bool isWin;
}

class AchievementUnlocked extends GameplayState {
  AchievementUnlocked({required this.achievement});

  final Achievement achievement;
}

class Paused extends GameplayState {}
