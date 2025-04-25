import 'package:card_crawler/data/local/local_game_save_service.dart';
import 'package:flutter/cupertino.dart';

import '../gameplay/model/game_data.dart';

class MainMenuProvider extends ChangeNotifier {
  GameData? _localGameData;

  GameData? get localGameData => _localGameData;

  Future<void> loadGameData() async {
    _localGameData = await LocalGameSaveService.load();
    notifyListeners();
  }
}
