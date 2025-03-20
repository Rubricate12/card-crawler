import 'package:card_crawler/constant/achievement.dart';

sealed class GameplayState {}

class Playing extends GameplayState {}

class Finished extends GameplayState {
  Finished({required this.isWin});

  final bool isWin;
}

class AchievementUnlocked extends GameplayState {
  AchievementUnlocked({required this.achievement});

  final Achievement achievement;
}

class Paused extends GameplayState {}
