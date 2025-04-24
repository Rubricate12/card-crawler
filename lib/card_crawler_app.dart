import 'package:card_crawler/ui/type/game_route.dart';
import 'package:card_crawler/ui/gameplay/gameplay_screen.dart';
import 'package:card_crawler/ui/main_menu/main_menu_screen.dart';
import 'package:flutter/material.dart';

class CardCrawlerApp extends StatelessWidget {
  const CardCrawlerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Crawler',
      theme: ThemeData(fontFamily: 'ConcertOne'),
      initialRoute: GameRoute.mainMenu.path,
      routes: {
        GameRoute.mainMenu.path: (context) => MainMenuScreen(),
        GameRoute.gameplay.path: (context) => GameplayScreen(),
      },
    );
  }
}
