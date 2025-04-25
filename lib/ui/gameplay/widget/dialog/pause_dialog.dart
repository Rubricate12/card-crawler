import 'package:flutter/material.dart';

import '../../../widget/menu_container.dart';
import '../../../widget/menu_item.dart';

class PauseDialog extends StatefulWidget {
  const PauseDialog({
    super.key,
    required this.onRestart,
    required this.onDeviceSave,
    required this.onCloudSave,
    required this.onExit,
  });

  final Function()? onRestart;
  final Function()? onDeviceSave;
  final Function()? onCloudSave;
  final Function()? onExit;

  @override
  State<PauseDialog> createState() => _PauseDialogState();
}

class _PauseDialogState extends State<PauseDialog> {
  bool isSaveDialogVisible = false;

  @override
  Widget build(BuildContext context) {
    return isSaveDialogVisible
        ? MenuContainer(
          children: [
            MenuItem(title: 'SAVE TO DEVICE', onPressed: widget.onDeviceSave),
            MenuItem(title: 'SAVE TO CLOUD', onPressed: widget.onCloudSave),
          ],
        )
        : MenuContainer(
          children: [
            MenuItem(title: 'RESTART', onPressed: widget.onRestart),
            MenuItem(
              title: 'SAVE',
              onPressed: () {
                setState(() {
                  isSaveDialogVisible = true;
                });
              },
            ),
            MenuItem(title: 'EXIT', onPressed: widget.onExit),
          ],
        );
  }
}
