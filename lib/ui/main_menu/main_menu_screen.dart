import 'package:card_crawler/ui/constant/game_route.dart';
import 'package:card_crawler/ui/widget/menu_container.dart';
import 'package:card_crawler/ui/widget/menu_item.dart';
import 'package:flutter/material.dart';

import '../theme/color.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/backgrounds/main.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Center(
              child: MenuContainer(
                children: [
                  MenuItem(
                    title: 'NEW GAME',
                    onPressed: () {
                      Navigator.pushNamed(context, GameRoute.gameplay.path);
                    },
                  ),
                  MenuItem(title: 'CONTINUE', onPressed: () {}),
                  MenuItem(title: 'LEADERBOARD', onPressed: () {}),
                  MenuItem(title: 'ACHIEVEMENTS', onPressed: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
