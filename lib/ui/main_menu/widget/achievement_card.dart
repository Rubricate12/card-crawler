import 'package:card_crawler/ui/extension/ui_scale.dart';
import 'package:flutter/material.dart';

import '../../../provider/gameplay/type/achievement.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({
    super.key,
    required this.achievement,
    required this.isUnlocked,
  });

  final Achievement achievement;
  final bool isUnlocked;

  @override
  Widget build(BuildContext context) {
    final uiScale = context.uiScale();

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      margin: EdgeInsets.all(4.0 * uiScale),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(16.0 * uiScale),
        child: Row(
          children: [
            Icon(
              isUnlocked ? Icons.lock_open : Icons.lock,
              size: 24.0 * uiScale,
            ),
            SizedBox(width: 16.0 * uiScale),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.name,
                  style: TextStyle(fontSize: 14.0 * uiScale),
                ),
                Text(
                  achievement.description,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12.0 * uiScale,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
