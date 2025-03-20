import 'package:card_crawler/model/user.dart';
import 'package:card_crawler/provider/gameplay/gameplay_action.dart';
import 'package:card_crawler/provider/gameplay/gameplay_state.dart';
import 'package:card_crawler/ui/gameplay/widget/card_placeholder.dart';
import 'package:card_crawler/ui/gameplay/widget/dialog_scrim.dart';
import 'package:card_crawler/ui/gameplay/widget/empty_card.dart';
import 'package:card_crawler/ui/util/ui_scale.dart';
import 'package:card_crawler/ui/widget/menu_container.dart';
import 'package:card_crawler/ui/widget/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:provider/provider.dart';

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
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: SafeArea(
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: cardWidth,
                        child: Column(
                          children: [
                            Expanded(child: SizedBox()),
                            gameplay.deck.isNotEmpty
                                ? PlayingCardView(
                                  card: gameplay.deck.last,
                                  showBack: true,
                                )
                                : AspectRatio(
                                  aspectRatio: playingCardAspectRatio,
                                  child: EmptyCard(),
                                ),
                            Expanded(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    size: componentWidth,
                                    color: Color(0xFFF24822),
                                  ),
                                  Text(
                                    gameplay.health.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32.0 * uiScale,
                                    ),
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
                            gameplay.field0
                                    .where((card) => card != null)
                                    .isNotEmpty
                                ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(4, (index) {
                                    PlayingCard? card = gameplay.field0[index];

                                    return SizedBox(
                                      width: cardWidth,
                                      child:
                                          card != null
                                              ? CardPlaceholder(
                                                card: card,
                                                onTap: () {
                                                  gameplay.action(
                                                    SelectCardFromField0(
                                                      card: card,
                                                      index: index,
                                                    ),
                                                  );
                                                },
                                              )
                                              : null,
                                    );
                                  }),
                                )
                                : SizedBox(
                                  width: cardWidth,
                                  child: AspectRatio(
                                    aspectRatio: playingCardAspectRatio,
                                    child: EmptyCard(),
                                  ),
                                ),
                            SizedBox(
                              width:
                                  gameplay.field1.isNotEmpty
                                      ? cardWidth * 1.25
                                      : cardWidth,
                              child:
                                  gameplay.field1.isNotEmpty
                                      ? FlatCardFan(
                                        children: List.of(
                                          gameplay.field1.map((card) {
                                            return SizedBox(
                                              width: cardWidth,
                                              child: PlayingCardView(
                                                card: card,
                                              ),
                                            );
                                          }),
                                        ),
                                      )
                                      : AspectRatio(
                                        aspectRatio: playingCardAspectRatio,
                                        child: EmptyCard(),
                                      ),
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
                                  child: Text('PAUSE', style: buttonTextStyle),
                                ),
                              ),
                            ),
                            gameplay.graveyard.isNotEmpty
                                ? PlayingCardView(card: gameplay.graveyard.last)
                                : AspectRatio(
                                  aspectRatio: playingCardAspectRatio,
                                  child: EmptyCard(),
                                ),
                            Expanded(
                              child: Center(
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
                        AchievementUnlocked(achievement: var achievement) =>
                          Text(
                            'Achievement unlocked: ${achievement.name}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32.0 * uiScale,
                            ),
                            textAlign: TextAlign.center,
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
        );
      },
    );
  }
}
