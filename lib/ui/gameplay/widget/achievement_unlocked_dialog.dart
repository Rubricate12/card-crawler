import 'package:card_crawler/constant/achievement.dart';
import 'package:card_crawler/ui/util/ui_scale.dart';
import 'package:flutter/material.dart';

class AchievementUnlockedDialog extends StatelessWidget {
  const AchievementUnlockedDialog({super.key, required this.achievement});

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    final double uiScale = context.uiScale();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Achievement unlocked: ${achievement.name}',
          style: TextStyle(color: Colors.white, fontSize: 32.0 * uiScale),
          textAlign: TextAlign.center,
        ),
        Text(
          achievement.desc,
          style: TextStyle(color: Colors.white70, fontSize: 24 * uiScale),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
