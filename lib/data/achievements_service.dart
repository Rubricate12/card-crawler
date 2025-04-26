import 'package:card_crawler/provider/gameplay/type/achievement.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AchievementsService {
  static const _key = 'achievements';

  static Future<void> addUnlockedAchievement(Achievement achievement) async {
    final prefs = await SharedPreferences.getInstance();
    final Set<String> unlockedAchievementIds =
        (prefs.getStringList(_key) ?? []).toSet();
    unlockedAchievementIds.add(achievement.id.toString());
    await prefs.setStringList(_key, unlockedAchievementIds.toList());
  }

  static Future<(List<Achievement>, List<Achievement>)>
  getAchievements() async {
    final prefs = await SharedPreferences.getInstance();

    final List<int> unlockedAchievementIds =
        (prefs.getStringList(_key) ?? []).map(int.parse).toList();

    final List<Achievement> unlockedAchievements = List.empty(growable: true);
    final List<Achievement> lockedAchievements = List.empty(growable: true);

    for (final achievement in Achievement.values) {
      if (unlockedAchievementIds.contains(achievement.id)) {
        unlockedAchievements.add(achievement);
      } else {
        lockedAchievements.add(achievement);
      }
    }

    unlockedAchievements.sort((a, b) => a.id.compareTo(b.id));
    lockedAchievements.sort((a, b) => a.id.compareTo(b.id));

    return (unlockedAchievements, lockedAchievements);
  }
}
