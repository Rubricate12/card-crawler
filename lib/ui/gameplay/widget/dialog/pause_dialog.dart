import 'package:flutter/material.dart';

import '../../../widget/menu_container.dart';
import '../../../widget/menu_item.dart';

class PauseDialog extends StatelessWidget {
  const PauseDialog({
    super.key,
    required this.onRestart,
    required this.onSave,
    required this.onExit,
  });

  final Function()? onRestart;
  final Function()? onSave;
  final Function()? onExit;

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      children: [
        MenuItem(title: 'RESTART', onPressed: onRestart),
        MenuItem(title: 'SAVE', onPressed: onSave),
        MenuItem(title: 'EXIT', onPressed: onExit),
      ],
    );
  }
}
