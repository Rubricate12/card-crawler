import 'package:card_crawler/constant/card_aspect_ratio.dart';
import 'package:flutter/material.dart';

import '../../../model/game_card.dart';

class GameCardView extends StatelessWidget {
  const GameCardView({super.key, required this.card, required this.onTap});

  final GameCard card;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
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
        aspectRatio: cardAspectRatio,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Text(
                    card.value.toString(),
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text('🎮', style: TextStyle(fontSize: 64.0),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
