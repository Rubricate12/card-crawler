import 'package:card_crawler/model/game_card.dart';
import 'package:card_crawler/ui/util/ui_scale.dart';
import 'package:flutter/material.dart';

import 'game_card_view.dart';

class EffectTriggeredDialog extends StatelessWidget {
  const EffectTriggeredDialog({
    super.key,
    required this.card,
    required this.cardWidth,
  });

  final GameCard card;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    final double uiScale = context.uiScale();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: cardWidth, child: GameCardView(card: card)),
        Text(
          'Effect triggered: ${card.effect.name}',
          style: TextStyle(color: Colors.white, fontSize: 32.0 * uiScale),
          textAlign: TextAlign.center,
        ),
        Text(
          card.effect.desc,
          style: TextStyle(color: Colors.white70, fontSize: 24 * uiScale),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
