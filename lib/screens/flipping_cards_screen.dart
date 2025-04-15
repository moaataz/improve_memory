import 'dart:async';

import 'package:flutter/material.dart';
import 'package:improve_memory/widgets/card_chip.dart';
import 'package:improve_memory/widgets/card_item.dart';

class FlippingCardsScreen extends StatefulWidget {
  const FlippingCardsScreen({super.key});

  @override
  State<FlippingCardsScreen> createState() => _FlippingCardsScreenState();
}

class _FlippingCardsScreenState extends State<FlippingCardsScreen> {
  bool isStarted = false;
  int cardsLength = 0;
  int hiddenCardsLength = 0;
  bool isFlipped = false;
  Timer? timer;
  final ValueNotifier<Duration> notifier =
      ValueNotifier<Duration>(Duration(seconds: 7));
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        notifier.value = Duration(seconds: notifier.value.inSeconds - 1);
      });
      if (notifier.value == Duration.zero) {
        setState(() {
          isFlipped = !isFlipped;
        });
        timer.cancel();
      }
    });
  }

  bool get allFlipped {
    return hiddenCardsLength >= cardsLength;
  }

  void restart() {
    setState(() {
      hiddenCardsLength = 0;
      isFlipped = false;
      isStarted = false;
      cardsLength = 0;
      notifier.value = Duration(seconds: 7);
      timer?.cancel();
      timer = null;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int remainingSeconds = notifier.value.inSeconds;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'memory quiz screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: cardsLength == 0
          ? Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisExtent: 85,
                      ),
                      shrinkWrap: true,
                      children: [
                        for (int i = 1; i <= 16; i++)
                          CardChip(
                            cardCount: 2 * i,
                            icon: Image.asset(
                              'assets/images/card_item_icon.png',
                              width: 40,
                            ),
                            onPressed: (val) {
                              setState(() {
                                cardsLength = val;
                                isStarted = true;
                              });
                              startTimer();
                            },
                          )
                      ],
                    ),
                  ),
                )
              ],
            )
          : Center(
              child: Stack(
                children: [
                  GridView.count(
                    crossAxisCount: 8,
                    children: [
                      for (int i = 1; i <= cardsLength; i++) CardItem(),
                    ],
                  ),
                  if (isFlipped)
                    GridView.count(
                      crossAxisCount: 8,
                      children: [
                        for (int i = 1;
                            i <= cardsLength - hiddenCardsLength;
                            i++)
                          Stack(
                            children: [
                              Image.asset(
                                'assets/images/blank_card.png',
                                width: 50,
                              ),
                            ],
                          )
                      ],
                    ),
                ],
              ),
            ),
      floatingActionButton: isStarted
          ? FloatingActionButton(
              onPressed: allFlipped
                  ? restart
                  : () {
                      if (isFlipped) {
                        setState(() {
                          hiddenCardsLength += 1;
                        });
                      }
                    },
              child: Text(
                remainingSeconds == 0
                    ? allFlipped
                        ? 'restart'
                        : 'show'
                    : remainingSeconds.toString(),
              ),
            )
          : null,
    );
  }
}
