import 'package:card_crawler/ui/util/ui_scale.dart';
import 'package:flutter/material.dart';

class FinishedDialog extends StatelessWidget {
  const FinishedDialog({super.key, required this.isWin});

  final bool isWin;

  @override
  Widget build(BuildContext context) {
    return Text(
      isWin ? 'You win' : 'You lose',
      style: TextStyle(color: Colors.white, fontSize: 32.0 * context.uiScale()),
      textAlign: TextAlign.center,
    );
  }
}
