import 'package:flutter/material.dart';

extension UiScale on BuildContext {
  double uiScale() {
    double screenWidth = MediaQuery.of(this).size.width;
    return screenWidth < 960 ? 0.75 : 1.0;
  }
}
