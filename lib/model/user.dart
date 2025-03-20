import 'package:card_crawler/constant/achievement.dart';

class User {
  User({this.level = 1, this.achievements = const []});

  int level;
  List<Achievement> achievements;
}
