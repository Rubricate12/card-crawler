import 'package:card_crawler/ui/constant/game_card_aspect_ratio.dart';
import 'package:card_crawler/model/user.dart';
import 'package:card_crawler/provider/gameplay/gameplay_action.dart';
import 'package:card_crawler/provider/gameplay/gameplay_state.dart';
import 'package:card_crawler/ui/gameplay/widget/game_card_view.dart';
import 'package:card_crawler/ui/gameplay/widget/dialog_scrim.dart';
import 'package:card_crawler/ui/gameplay/widget/empty_card.dart';
import 'package:card_crawler/ui/util/ui_scale.dart';
import 'package:card_crawler/ui/widget/menu_container.dart';
import 'package:card_crawler/ui/widget/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/game_card.dart';
import '../../provider/gameplay/gameplay_provider.dart';
import '../../provider/gameplay/ui_action.dart';
import '../theme/color.dart';

class GameplayScreen extends StatefulWidget {
  const GameplayScreen({super.key});

  @override
  State<GameplayScreen> createState() => _GameplayScreenState();
}

class _GameplayScreenState extends State<GameplayScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GameplayProvider>().init(user: User(), level: 1);
  }

  @override
  Widget build(BuildContext context) {
    double uiScale = context.uiScale();

    double cardWidth = 144.0 * uiScale;

    double componentWidth = 96.0 * uiScale;

    ButtonStyle buttonStyle = FilledButton.styleFrom(
      backgroundColor: Color(0xFFD1FFFA),
      disabledBackgroundColor: Color(0xFFFFAAA4),
      overlayColor: Colors.black,
      padding: EdgeInsets.zero,
      fixedSize: Size(componentWidth, 48.0 * uiScale),
    );

    TextStyle buttonTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 24.0 * uiScale,
    );

    return Consumer<GameplayProvider>(
      builder: (context, gameplay, child) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, _) {
            if (didPop) return;

            switch (gameplay.state) {
              case Playing():
                gameplay.uiAction(Pause());
              case Finished():
                Navigator.pop(context);
              default:
                gameplay.uiAction(DismissDialog());
            }
          },
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: backgroundColor,
                body: SafeArea(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/backgrounds/main.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: cardWidth,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 48.0 * uiScale,
                                      child: Center(
                                        child: Text(
                                          'ROUND: ${gameplay.round.toString()}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24.0 * uiScale,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                gameplay.deck.isNotEmpty
                                    ? AspectRatio(
                                      aspectRatio: gameCardAspectRatio,
                                      child: Card(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            gameplay.deck.length.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 48 * uiScale,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    : EmptyCard(),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Icon(
                                            Icons.favorite,
                                            size: componentWidth * 0.75,
                                            color: Color(0xFFF24822),
                                          ),
                                          Text(
                                            gameplay.health.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.0 * uiScale,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Icon(
                                            Icons.shield,
                                            size: componentWidth * 0.75,
                                            color: Color(0xFF72849A),
                                          ),
                                          Text(
                                            gameplay.durability.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.0 * uiScale,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 576.0 * uiScale,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(4, (index) {
                                    GameCard? card =
                                        gameplay.dungeonField[index];

                                    return SizedBox(
                                      width: cardWidth,
                                      child:
                                          card != null
                                              ? GameCardView(
                                                card: card,
                                                onTap: () {
                                                  gameplay.action(
                                                    SelectCardFromDungeonField(
                                                      card: card,
                                                      index: index,
                                                    ),
                                                  );
                                                },
                                              )
                                              : EmptyCard(),
                                    );
                                  }),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: cardWidth,
                                      child:
                                          gameplay.weapon != null
                                              ? GameCardView(
                                                card: gameplay.weapon!,
                                                onTap: () {},
                                              )
                                              : EmptyCard(),
                                    ),
                                    Row(
                                      children: List.generate(3, (index) {
                                        GameCard? card =
                                            index < gameplay.accessories.length
                                                ? gameplay.accessories[index]
                                                : null;

                                        return SizedBox(
                                          width: cardWidth,
                                          child:
                                              card != null
                                                  ? GameCardView(
                                                    card: card,
                                                    onTap: () {
                                                      gameplay.action(
                                                        SelectCardFromAccessories(
                                                          card: card,
                                                          index: index,
                                                        ),
                                                      );
                                                    },
                                                  )
                                                  : EmptyCard(),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: cardWidth,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: FilledButton(
                                      onPressed: () {
                                        gameplay.uiAction(Pause());
                                      },
                                      style: buttonStyle,
                                      child: Text(
                                        'PAUSE',
                                        style: buttonTextStyle,
                                      ),
                                    ),
                                  ),
                                ),
                                gameplay.graveyard.isNotEmpty
                                    ? GameCardView(
                                      card: gameplay.graveyard.last,
                                      onTap: () {},
                                    )
                                    : EmptyCard(),
                                Expanded(
                                  child: Center(
                                    child: FilledButton(
                                      onPressed:
                                          gameplay.canFlee
                                              ? () {
                                                gameplay.action(Flee());
                                                FocusScope.of(
                                                  context,
                                                ).unfocus();
                                              }
                                              : null,
                                      style: buttonStyle,
                                      child: Text(
                                        'FLEE',
                                        style: buttonTextStyle,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (gameplay.state is! Playing)
                        DialogScrim(
                          onTap: () {
                            gameplay.state is Finished
                                ? Navigator.pop(context)
                                : gameplay.uiAction(DismissDialog());
                          },
                          padding: EdgeInsets.all(16.0),
                          child: switch (gameplay.state) {
                            EffectTriggered(card: var card) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: cardWidth,
                                  child: GameCardView(card: card, onTap: () {}),
                                ),
                                Text(
                                  'Effect triggered: ${card.effect.name}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32.0 * uiScale,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  card.effect.desc,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 24 * uiScale,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            AchievementUnlocked(achievement: var achievement) =>
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Achievement unlocked: ${achievement.name}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32.0 * uiScale,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    achievement.desc,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 24 * uiScale,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            Finished(isWin: var isWin) => Text(
                              isWin ? 'You win' : 'You lose',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32.0 * uiScale,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            _ => MenuContainer(
                              children: [
                                MenuItem(
                                  title: 'RESTART',
                                  onPressed: () {
                                    gameplay.init(user: User(), level: 1);
                                  },
                                ),
                                MenuItem(title: 'SAVE', onPressed: () {}),
                                MenuItem(
                                  title: 'EXIT',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
