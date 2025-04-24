import 'package:card_crawler/provider/gameplay/type/card_location.dart';

sealed class UiAction {}

class TapCard extends UiAction {
  TapCard({required this.location, required this.index});

  CardLocation location;
  int index;
}

class ShowGraveyard extends UiAction {}

class Pause extends UiAction {}

class DismissDialog extends UiAction {}
