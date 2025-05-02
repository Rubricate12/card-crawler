import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  static Future<void> updateAchievements(String username, List<int> achievementIds) async {
    try {
      // Loop through the achievements list and unlock them one by one
      for (int achievementId in achievementIds) {

        final response = await http.post(
          Uri.parse('$baseUrl/achievements/unlock'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'username': username,
            'achievement_id': achievementId,
          }),
        );

        debugPrint('Response status: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');

        if (response.statusCode == 200) {
          debugPrint('Successfully unlocked achievement: $achievementId for user: $username');
        } else {
          debugPrint('Failed to unlock achievement: $achievementId for user: $username, Status: ${response.statusCode}');
          throw Exception('Failed to unlock achievement');
        }
        await Future.delayed(const Duration(milliseconds: 200));
      }
    } catch (e) {
      debugPrint('Error updating achievements: $e');
      throw Exception('Error updating achievements: $e');
    }
  }

  static Future<http.Response> getAchievements(String username) async {
    final response = await http.post(
      Uri.parse('$baseUrl/achievements'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username}),
    );

    return response;
  }

  static Future<http.Response> registerUser(String username, String pass) async {
    //parse api utk register
    final url = Uri.parse('$baseUrl/register');
    //build response utk post method ke database
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'pass': pass,
      }),
    );

    return response;
  }
  static Future<http.Response> login(String username, String password) async {
    //parse api utk login
    final url = Uri.parse('$baseUrl/login');
    //build response utk post method ke database
    final response = await http.post(
      url,
      body: {
        'username': username,
        'pass': password,
      },
    );
    return response;
  }
}