import 'package:card_crawler/model/game_card.dart';
import 'package:card_crawler/provider/gameplay/constant/card_location.dart';
import 'package:card_crawler/ui/constant/game_card_aspect_ratio.dart';
import 'package:card_crawler/ui/gameplay/widget/game_card_view.dart';
import 'package:card_crawler/ui/util/ui_scale.dart';
import 'package:flutter/material.dart';

class GraveyardDialog extends StatelessWidget {
  const GraveyardDialog({
    super.key,
    required this.cards,
    required this.cardWidth,
    required this.onCardTap,
    required this.cardEffectDetailsToShow,
  });

  final List<GameCard> cards;
  final double cardWidth;
  final Function(int) onCardTap;
  final (CardLocation?, int) cardEffectDetailsToShow;

  @override
  Widget build(BuildContext context) {
    final double uiScale = context.uiScale();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      width: 576.0 * uiScale + 48.0,
      clipBehavior: Clip.antiAlias,
      child: GridView.builder(
        padding: EdgeInsets.all(24.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: gameCardAspectRatio,
        ),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final reversedIndex = cards.length - 1 - index;

          return SizedBox(
            width: cardWidth,
            child: GameCardView(
              card: cards[reversedIndex],
              onTap: () {
                onCardTap(reversedIndex);
              },
              showEffectDetails:
                  cardEffectDetailsToShow ==
                  (CardLocation.graveyard, reversedIndex),
              selectionColor: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
