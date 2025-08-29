import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:improve_memory/constants/objects.dart';
import 'package:improve_memory/providers/app_data_provider.dart';
import 'package:improve_memory/resources/color_resource.dart';
import 'package:improve_memory/resources/edge_insets_manager.dart';
import 'package:improve_memory/resources/string_resource.dart';
import 'package:improve_memory/resources/text_styles.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class IncreaseEyeShotRetentionScreen extends ConsumerStatefulWidget {
  const IncreaseEyeShotRetentionScreen({super.key});

  @override
  ConsumerState<IncreaseEyeShotRetentionScreen> createState() =>
      _IncreaseEyeShotRetentionScreenState();
}

class _IncreaseEyeShotRetentionScreenState
    extends ConsumerState<IncreaseEyeShotRetentionScreen> {
  int verticalLength = 1;
  var fieldBoolean = false;
  @override
  Widget build(BuildContext context) {
    int wpm = ref.watch(appDataProvider.notifier).wpm;
    return Scaffold(
      appBar: AppBar(
        title: Text(StringResource.increaseEyeShotRetention),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text(StringResource.selectWpmSpeed),
                  content: SizedBox(
                    width: 70,
                    height: 80,
                    child: ScrollablePositionedList.builder(
                      shrinkWrap: true,
                      itemBuilder: (ctx, i) => Center(
                        child: GestureDetector(
                          onTap: () {
                            ref
                                .read(appDataProvider.notifier)
                                .setWpm(wpmList[i]);
                            setState(() {
                              wpm = ref.watch(appDataProvider.notifier).wpm;
                            });
                            Navigator.of(ctx).pop();
                          },
                          child: Text(
                            (wpmList[i]).toString(),
                            style: h3TextStyle,
                          ),
                        ),
                      ),
                      itemCount: wpmList.length,
                      initialScrollIndex: wpmList.lastIndexOf(wpm),
                    ),
                  ),
                ),
              );
            },
            icon: Icon(Icons.speed),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      verticalLength += 1;
                    });
                  },
                  icon: Icon(Icons.add),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      fieldBoolean = !fieldBoolean;
                    });
                  },
                  child: Text(StringResource.scramble),
                ),
                IconButton(
                  onPressed: () {
                    if (verticalLength > 1) {
                      setState(() {
                        verticalLength -= 1;
                      });
                    }
                  },
                  icon: Icon(Icons.remove),
                )
              ],
            ),
            for (int i = 0; i < 7; i++)
              NumberGuessRow(
                wpm: wpm,
                length: i + 1,
                verticalLength: verticalLength,
                key: ValueKey([i, fieldBoolean]),
              ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class NumberGuessRow extends StatefulWidget {
  const NumberGuessRow({
    super.key,
    required this.wpm,
    required this.length,
    required this.verticalLength,
  });
  final int wpm;
  final int length;
  final int verticalLength;

  @override
  State<NumberGuessRow> createState() => _NumberGuessRowState();
}

class _NumberGuessRowState extends State<NumberGuessRow> {
  bool hidden = false;
  bool isCorrect = false;
  int randomNumber(int index) {
    return faker.randomGenerator.integer(int.parse('9' * index),
        min: int.parse('1' + '0' * (index - 1)));
  }

  late List<int> randomNumberValue;
  @override
  void initState() {
    randomNumberValue = [
      for (var i = 0; i < widget.verticalLength; i++)
        randomNumber(widget.length)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var randomNumberString = randomNumberValue.join();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Container(
          padding: e_8_all,
          width: 80,
          alignment: Alignment.center,
          child: Stack(
            children: [
              Column(
                children: [
                  for (var i in randomNumberValue) Text(i.toString()),
                ],
              ),
              if (!hidden)
                Container(
                  color: ColorResource.grey,
                  width: 8 * widget.length.toDouble(),
                  height: 20 * widget.verticalLength.toDouble(),
                )
            ],
          ),
        ),
        Container(
          color: ColorResource.grey200,
          height: 20 * widget.verticalLength.toDouble(),
          width: 70,
          child: TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: (val) {
              if (val != randomNumberString) {
                setState(() {
                  isCorrect = false;
                });
              } else {
                setState(() {
                  isCorrect = true;
                });
              }
            },
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              hidden = true;
            });
            Future.delayed(Duration(milliseconds: (60000 / widget.wpm).toInt()),
                () {
              setState(() {
                hidden = false;
              });
            });
          },
          icon: Icon(isCorrect ? Icons.check : Icons.remove_red_eye),
        ),
        Spacer(),
      ],
    );
  }
}
