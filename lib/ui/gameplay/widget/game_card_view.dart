import 'package:card_crawler/ui/constant/game_card_aspect_ratio.dart';
import 'package:card_crawler/ui/util/ui_scale.dart';
import 'package:flutter/material.dart';

import '../../../model/game_card.dart';

class GameCardView extends StatelessWidget {
  const GameCardView({
    super.key,
    required this.card,
    this.onTap,
    this.isEffectDetailsVisible = false,
    this.extraActionDescription,
    this.selectionColor,
  });

  final GameCard card;
  final Function()? onTap;
  final bool isEffectDetailsVisible;
  final String? extraActionDescription;
  final Color? selectionColor;

  @override
  Widget build(BuildContext context) {
    final double uiScale = context.uiScale();
    final bool isSmallScreen = context.isSmallScreen();

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onHighlightChanged: (_) {
          FocusScope.of(context).unfocus();
        },
        onHover: (_) {
          FocusScope.of(context).unfocus();
        },
        focusColor: (selectionColor ?? Colors.white).withValues(alpha: 0.7),
        hoverColor: (selectionColor ?? Colors.white).withValues(alpha: 0.5),
        highlightColor: (selectionColor ?? Colors.white).withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(8.0 + 4.0 * uiScale),
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
              padding: EdgeInsets.all(
                (isEffectDetailsVisible ? 16.0 : 4.0) * uiScale,
              ),
              child:
                  isEffectDetailsVisible
                      ? Column(
                        children: [
                          Expanded(
                            flex: 9,
                            child: Column(
                              children: [
                                Text(
                                  'Effect: ${card.effect.name}',
                                  style: TextStyle(fontSize: 14.0 * uiScale),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  card.effect.desc,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12.0 * uiScale,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          if (extraActionDescription != null)
                            Expanded(
                              flex: 1,
                              child: Text(
                                extraActionDescription!,
                                style: TextStyle(fontSize: 12.0 * uiScale),
                                textAlign: TextAlign.center,
                              ),
                            ),
                        ],
                      )
                      : Stack(
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
      ),
    );
  }
}
