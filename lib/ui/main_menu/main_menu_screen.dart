import 'package:card_crawler/provider/main_menu/main_menu_provider.dart';
import 'package:card_crawler/ui/type/game_route.dart';
import 'package:card_crawler/ui/widget/dialog_scrim.dart';
import 'package:card_crawler/ui/widget/menu_container.dart';
import 'package:card_crawler/ui/widget/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/color.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  bool isContinueDialogVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Consumer<MainMenuProvider>(
        builder:
            (context, provider, child) => Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/backgrounds/main.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: MenuContainer(
                    children: [
                      MenuItem(
                        title: 'NEW GAME',
                        onPressed: () {
                          Navigator.pushNamed(context, GameRoute.gameplay.path);
                        },
                      ),
                      MenuItem(
                        title: 'CONTINUE',
                        onPressed: () {
                          provider.loadGameData();
                          setState(() {
                            isContinueDialogVisible = true;
                          });
                        },
                      ),
                      MenuItem(title: 'LEADERBOARD', onPressed: null),
                      MenuItem(title: 'ACHIEVEMENTS', onPressed: null),
                    ],
                  ),
                ),
                if (isContinueDialogVisible)
                  DialogScrim(
                    onDismiss: () {
                      setState(() {
                        isContinueDialogVisible = false;
                      });
                    },
                    child: MenuContainer(
                      children: [
                        MenuItem(
                          title: 'CONTINUE FROM DEVICE',
                          onPressed:
                              provider.localGameData == null
                                  ? null
                                  : () {
                                    Navigator.pushNamed(
                                      context,
                                      GameRoute.gameplay.path,
                                      arguments: provider.localGameData,
                                    );
                                    setState(() {
                                      isContinueDialogVisible = false;
                                    });
                                  },
                        ),
                        MenuItem(title: 'CONTINUE FROM CLOUD', onPressed: null),
                      ],
                    ),
                  ),
              ],
            ),
      ),
    );
  }
}
