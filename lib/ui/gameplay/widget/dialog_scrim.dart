import 'package:flutter/material.dart';

class DialogScrim extends StatelessWidget {
  const DialogScrim({
    super.key,
    required this.onTap,
    this.padding,
    required this.child,
  });

  final Function() onTap;
  final EdgeInsetsGeometry? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withValues(alpha: 0.6),
        child: Center(
          child: Padding(padding: padding ?? EdgeInsets.all(0), child: child),
        ),
      ),
    );
  }
}
