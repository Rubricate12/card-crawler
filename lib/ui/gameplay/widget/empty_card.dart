import 'package:card_crawler/ui/constant/game_card_aspect_ratio.dart';
import 'package:card_crawler/ui/util/ui_scale.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0 * context.uiScale()),
      child: AspectRatio(
        aspectRatio: gameCardAspectRatio,
        child: DottedBorder(
          color: Colors.black,
          borderType: BorderType.RRect,
          radius: Radius.circular(8.0),
          child: SizedBox(),
        ),
      ),
    );
  }
}
