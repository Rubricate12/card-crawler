import 'package:card_crawler/ui/extension/ui_scale.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class EmptyAchievementsPlaceholder extends StatelessWidget {
  const EmptyAchievementsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final double uiScale = context.uiScale();

    return Padding(
      padding: EdgeInsets.all(4.0 * uiScale),
      child: DottedBorder(
        color: Colors.black,
        borderType: BorderType.RRect,
        radius: Radius.circular(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(16.0 * uiScale),
            child: Text(
              'None',
              style: TextStyle(fontSize: 14.0 * uiScale),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
