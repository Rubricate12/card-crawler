import 'package:card_crawler/ui/util/ui_scale.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.title, required this.onPressed});

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    double uiScale = context.uiScale();

    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          overlayColor: Colors.black,
          padding: EdgeInsets.zero,
          fixedSize: Size(double.infinity, 48.0 * uiScale),
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 24.0 * uiScale),
        ),
      ),
    );
  }
}
