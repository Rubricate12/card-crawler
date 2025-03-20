import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.black,
      borderType: BorderType.RRect,
      radius: Radius.circular(12.0),
      child: SizedBox(),
    );
  }
}
