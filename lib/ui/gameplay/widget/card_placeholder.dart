import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

class CardPlaceholder extends StatelessWidget {
  const CardPlaceholder({super.key, required this.card, required this.onTap});

  final PlayingCard card;
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
      child: PlayingCardView(card: card),
    );
  }
}
