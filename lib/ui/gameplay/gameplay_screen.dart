import 'package:card_crawler/ui/constant/game_card_aspect_ratio.dart';
import 'package:card_crawler/model/user.dart';
import 'package:card_crawler/provider/gameplay/gameplay_action.dart';
import 'package:card_crawler/provider/gameplay/gameplay_state.dart';
import 'package:card_crawler/ui/gameplay/widget/achievement_unlocked_dialog.dart';
import 'package:card_crawler/ui/gameplay/widget/effect_triggered_dialog.dart';
import 'package:card_crawler/ui/gameplay/widget/finished_dialog.dart';
import 'package:card_crawler/ui/gameplay/widget/game_card_view.dart';
import 'package:card_crawler/ui/gameplay/widget/dialog_scrim.dart';
import 'package:card_crawler/ui/gameplay/widget/empty_card.dart';
import 'package:card_crawler/ui/gameplay/widget/graveyard_dialog.dart';
import 'package:card_crawler/ui/gameplay/widget/main_section.dart';
import 'package:card_crawler/ui/gameplay/widget/pause_dialog.dart';
import 'package:card_crawler/ui/gameplay/widget/replace_accessory_dialog.dart';
import 'package:card_crawler/ui/gameplay/widget/side_section.dart';
import 'package:card_crawler/ui/util/ui_scale.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/game_card.dart';
import '../../provider/gameplay/constant/card_location.dart';
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
    final double uiScale = context.uiScale();

    final double cardWidth = 144.0 * uiScale;

    final double componentWidth = 96.0 * uiScale;

    final ButtonStyle buttonStyle = FilledButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Color(0xFFD1FFFA),
      disabledForegroundColor: Colors.black,
      disabledBackgroundColor: Color(0xFFFFAAA4),
      overlayColor: Colors.black,
      padding: EdgeInsets.zero,
      fixedSize: Size(componentWidth, 48.0 * uiScale),
    );

    final TextStyle buttonTextStyle = TextStyle(fontSize: 24.0 * uiScale);

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
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: Stack(
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
                    SideSection(
                      width: cardWidth,
                      topContent: Center(
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
                      cardContent:
                          gameplay.deck.isNotEmpty
                              ? AspectRatio(
                                aspectRatio: gameCardAspectRatio,
                                child: Card(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
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
                      bottomContent: Row(
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
                    MainSection(
                      width: 576.0 * uiScale,
                      topContent: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          final GameCard? card = gameplay.dungeonField[index];
                          final bool isEffectDetailsVisible =
                              gameplay.cardWithVisibleEffectDetails ==
                              (CardLocation.dungeonField, index);

                          return SizedBox(
                            width: cardWidth,
                            child:
                                card != null
                                    ? GameCardView(
                                      card: card,
                                      onTap: () {
                                        isEffectDetailsVisible
                                            ? gameplay.action(
                                              SelectCardFromDungeonField(
                                                card: card,
                                                index: index,
                                              ),
                                            )
                                            : gameplay.uiAction(
                                              TapCard(
                                                location:
                                                    CardLocation.dungeonField,
                                                index: index,
                                              ),
                                            );
                                      },
                                      isEffectDetailsVisible:
                                          isEffectDetailsVisible,
                                      extraActionDescription: 'TAP TO SELECT',
                                    )
                                    : EmptyCard(),
                          );
                        }),
                      ),
                      bottomContent: Row(
                        children: [
                          SizedBox(
                            width: cardWidth,
                            child:
                                gameplay.weapon != null
                                    ? GameCardView(
                                      card: gameplay.weapon!,
                                      onTap: () {
                                        gameplay.uiAction(
                                          TapCard(
                                            location: CardLocation.weapon,
                                            index: 0,
                                          ),
                                        );
                                      },
                                      isEffectDetailsVisible:
                                          gameplay.cardWithVisibleEffectDetails ==
                                          (CardLocation.weapon, 0),
                                    )
                                    : EmptyCard(),
                          ),
                          Row(
                            children: List.generate(3, (index) {
                              final GameCard? card =
                                  index < gameplay.accessories.length &&
                                          gameplay.state is! ReplacingAccessory
                                      ? gameplay.accessories[index]
                                      : null;
                              final bool isEffectDetailsVisible =
                                  gameplay.cardWithVisibleEffectDetails ==
                                  (CardLocation.accessories, index);

                              return SizedBox(
                                width: cardWidth,
                                child:
                                    card != null
                                        ? GameCardView(
                                          card: card,
                                          onTap: () {
                                            gameplay.uiAction(
                                              TapCard(
                                                location:
                                                    CardLocation.accessories,
                                                index: index,
                                              ),
                                            );
                                          },
                                          isEffectDetailsVisible:
                                              isEffectDetailsVisible,
                                        )
                                        : EmptyCard(),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    SideSection(
                      width: cardWidth,
                      topContent: Center(
                        child: FilledButton(
                          onPressed: () {
                            gameplay.uiAction(Pause());
                          },
                          style: buttonStyle,
                          child: Text('PAUSE', style: buttonTextStyle),
                        ),
                      ),
                      cardContent:
                          gameplay.graveyard.isNotEmpty
                              ? GameCardView(
                                card: gameplay.graveyard.last,
                                onTap: () {
                                  gameplay.uiAction(ShowGraveyard());
                                },
                              )
                              : EmptyCard(),
                      bottomContent: Center(
                        child: FilledButton(
                          onPressed:
                              gameplay.canFlee
                                  ? () {
                                    gameplay.action(Flee());
                                    FocusScope.of(context).unfocus();
                                  }
                                  : null,
                          style: buttonStyle,
                          child: Text('FLEE', style: buttonTextStyle),
                        ),
                      ),
                    ),
                  ],
                ),
                if (gameplay.state is! Playing)
                  DialogScrim(
                    onDismiss:
                        gameplay.state is ReplacingAccessory
                            ? null
                            : () {
                              gameplay.state is Finished
                                  ? Navigator.pop(context)
                                  : gameplay.uiAction(DismissDialog());
                            },
                    margin: EdgeInsets.all(64.0 * uiScale),
                    child: switch (gameplay.state) {
                      ReplacingAccessory() => ReplaceAccessoryDialog(
                        accessories: gameplay.accessories,
                        cardWidth: cardWidth,
                        onCardTap: (index) {
                          final bool isEffectDetailsVisible =
                              gameplay.cardWithVisibleEffectDetails ==
                              (CardLocation.accessories, index);

                          if (isEffectDetailsVisible) {
                            gameplay.action(
                              ReplaceAccessory(
                                card: gameplay.accessories[index],
                                index: index,
                              ),
                            );
                          } else {
                            gameplay.uiAction(
                              TapCard(
                                location: CardLocation.accessories,
                                index: index,
                              ),
                            );
                          }
                        },
                        cardWithVisibleEffectDetails:
                            gameplay.cardWithVisibleEffectDetails,
                      ),
                      EffectTriggered(card: var card) => EffectTriggeredDialog(
                        card: card,
                        cardWidth: cardWidth,
                      ),
                      GraveyardShown() => GraveyardDialog(
                        cards: gameplay.graveyard,
                        cardWidth: cardWidth,
                        onCardTap: (index) {
                          gameplay.uiAction(
                            TapCard(
                              location: CardLocation.graveyard,
                              index: index,
                            ),
                          );
                        },
                        cardWithVisibleEffectDetails:
                            gameplay.cardWithVisibleEffectDetails,
                      ),
                      AchievementUnlocked(achievement: var achievement) =>
                        AchievementUnlockedDialog(achievement: achievement),
                      Finished(isWin: var isWin) => FinishedDialog(
                        isWin: isWin,
                      ),
                      _ => PauseDialog(
                        onRestart: () {
                          gameplay.init(user: User(), level: 1);
                        },
                        onSave: null,
                        onExit: () {
                          Navigator.pop(context);
                        },
                      ),
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
