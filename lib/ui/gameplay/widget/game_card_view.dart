import 'package:card_crawler/ui/constant/game_card_aspect_ratio.dart';
import 'package:card_crawler/ui/util/ui_scale.dart';
import 'package:flutter/material.dart';

import '../../../model/game_card.dart';

class GameCardView extends StatelessWidget {
  const GameCardView({super.key, required this.card, required this.onTap});

  final GameCard card;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    double uiScale = context.uiScale();
    bool isSmallScreen = context.isSmallScreen();

    return InkWell(
      onTap: onTap,
      onHighlightChanged: (_) {
        FocusScope.of(context).unfocus();
      },
      onHover: (_) {
        FocusScope.of(context).unfocus();
      },
      focusColor: Colors.white.withValues(alpha: 0.7),
      hoverColor: Colors.white.withValues(alpha: 0.5),
      highlightColor: Colors.white.withValues(alpha: 0.8),
      borderRadius: BorderRadius.circular(12.0),
      child: AspectRatio(
        aspectRatio: gameCardAspectRatio,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: EdgeInsets.all(4.0 * uiScale),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: EdgeInsets.all(4.0 * uiScale),
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: 64.0,
                    child: Image.asset(card.asset),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 40.0 * uiScale,
                    height: 40.0 * uiScale,
                    child: Image.asset(
                      isSmallScreen
                          ? card.type.assetSmall
                          : card.type.asset,
                      fit: BoxFit.none,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 40.0 * uiScale,
                    height: 40.0 * uiScale,
                    child: Center(
                      child: Text(
                        card.value.toString(),
                        style: TextStyle(fontSize: 24.0 * uiScale),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
