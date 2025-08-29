import 'package:flutter/material.dart';
import 'package:improve_memory/constants/objects.dart';
import 'package:improve_memory/constants/reading_questions.dart';
import 'package:improve_memory/resources/asset_resource.dart';
import 'package:improve_memory/resources/button_style_resource.dart';
import 'package:improve_memory/resources/color_resource.dart';
import 'package:improve_memory/resources/extensions.dart';
import 'package:improve_memory/resources/string_resource.dart';
import 'package:improve_memory/resources/text_styles.dart';
import 'package:improve_memory/screens/reading_fast/improve_reading_speed.dart';
import 'package:improve_memory/resources/edge_insets_manager.dart';

class ReadingFastScreen extends StatelessWidget {
  const ReadingFastScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringResource.readingFast),
        backgroundColor: ColorResource.blue,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  final wpm = await showModalBottomSheet<double?>(
                    context: context,
                    builder: (ctx) {
                      final stopwatch = Stopwatch();
                      final question = threeLinesQuestions[
                          randomizer.nextInt(threeLinesQuestions.length)];
                      stopwatch.start();
                      return Container(
                        padding: e_16_all,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(question),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    final wpm = question.split(' ').length /
                                        (stopwatch.elapsedMilliseconds / 60000);
                                    Navigator.of(context).pop(wpm);
                                    stopwatch.stop();
                                  },
                                  style: ButtonStyleResource
                                      .circularLeftButtonStyle,
                                  child: Text(StringResource.yes),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    final wpm = question.split(' ').length /
                                        (stopwatch.elapsedMilliseconds / 60000);
                                    Navigator.of(context).pop(wpm);
                                    stopwatch.stop();
                                  },
                                  style: ButtonStyleResource
                                      .circularRightButtonStyle,
                                  child: Text(StringResource.no),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                  if (wpm != null) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text(
                          StringResource.yourReadingSpeedIsWpm(wpm),
                          style: h3TextStyle,
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(StringResource.gotIt))
                        ],
                      ),
                    );
                  }
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: ColorResource.grey209,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      S100Image.asset(
                        AssetIcon.speedTest,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        StringResource.testYourReadingSpeed,
                        style: h3TextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              GestureDetector(
                onTap: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ImprovingReadingSpeed(),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: ColorResource.grey209,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      S100Image.asset(
                        AssetIcon.dumbbell,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        StringResource.startImprovingReadingSpeed,
                        style: h3TextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
