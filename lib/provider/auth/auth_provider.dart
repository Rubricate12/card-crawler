import 'package:flutter/material.dart';
import 'package:card_crawler/data/achievements_service.dart';

class AuthProvider with ChangeNotifier {
  String? _username;

  String? get username => _username;

  // void login(String username) {
  //
  //   _username = username;
  //   notifyListeners();
  // }

  Future<void> login(String username) async {
    await AchievementsService.clearGuestAchievements();
    _username = username;
    notifyListeners();
  }

  void logout() {
    _username = null;
    notifyListeners();
  }

  Future<void> playAsGuest() async {
    await AchievementsService.clearGuestAchievements();
    _username = null;
    notifyListeners();
  }
}