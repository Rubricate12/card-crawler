sealed class GameplayState {}

class Playing extends GameplayState {}

class Finished extends GameplayState {
  Finished({required this.isWin});

  final bool isWin;
}

class AchievementUnlocked extends GameplayState {}

class Paused extends GameplayState {}
