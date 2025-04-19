import 'package:card_crawler/ui/util/ui_scale.dart';
import 'package:flutter/material.dart';

import '../../../model/game_card.dart';
import '../../../provider/gameplay/constant/card_location.dart';
import 'game_card_view.dart';

class ReplaceAccessoryDialog extends StatelessWidget {
  const ReplaceAccessoryDialog({
    super.key,
    required this.accessories,
    required this.cardWidth,
    required this.onCardTap,
    required this.cardWithVisibleEffectDetails,
  });

  final List<GameCard> accessories;
  final double cardWidth;
  final Function(int) onCardTap;
  final (CardLocation?, int) cardWithVisibleEffectDetails;

  @override
  Widget build(BuildContext context) {
    final double uiScale = context.uiScale();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Select a card to be replaced',
          style: TextStyle(color: Colors.white, fontSize: 32.0 * uiScale),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24.0),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(accessories.length, (index) {
            final bool isEffectDetailsVisible =
                cardWithVisibleEffectDetails == (CardLocation.accessories, index);

            return SizedBox(
              width: cardWidth,
              child: GameCardView(
                card: accessories[index],
                onTap: () {
                  onCardTap(index);
                },
                isEffectDetailsVisible: isEffectDetailsVisible,
                extraActionDescription: 'TAP TO REPLACE',
              ),
            );
          }),
        ),
      ],
    );
  }
}
