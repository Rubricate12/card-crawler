import 'package:playing_cards/playing_cards.dart';

class AchievementChecker {
  static bool dungeonCrawler(int playerLevel, int gameLevel) =>
      playerLevel == gameLevel;

  static bool nice(int weapon, int durability) =>
      weapon == 6 && durability == 9;

  static bool fourOfAKind(List<PlayingCard?> field0) {
    List<PlayingCard> notNullField0 = field0.whereType<PlayingCard>().toList();
    if (notNullField0.length == 4) {
      var card0Value = notNullField0[0].value;
      return notNullField0.every((card) => card.value == card0Value);
    } else {
      return false;
    }
  }

  static bool perfectAdventurer(int health) => health == 20;
}
