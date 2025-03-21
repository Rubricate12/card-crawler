import 'package:card_crawler/constant/achievement.dart';

class User {
  User({this.level = 1, List<Achievement>? achievements}) {
    this.achievements = achievements ?? List.empty(growable: true);
  }

  int level;
  List<Achievement> achievements = List.empty(growable: true);
}
