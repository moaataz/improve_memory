import 'package:flutter/material.dart';
import 'package:improve_memory/constants/objects.dart';
import 'package:improve_memory/constants/reading_questions.dart';
import 'package:improve_memory/screens/reading_fast/improve_reading_speed.dart';

class ReadingFastScreen extends StatelessWidget {
  const ReadingFastScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('reading fast'),
        backgroundColor: Colors.blue,
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
                        padding: EdgeInsets.all(16),
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
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.horizontal(
                                              left: Radius.circular(30)))),
                                  child: Text('yes'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    final wpm = question.split(' ').length /
                                        (stopwatch.elapsedMilliseconds / 60000);
                                    Navigator.of(context).pop(wpm);
                                    stopwatch.stop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.horizontal(
                                              right: Radius.circular(30)))),
                                  child: Text('no'),
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
                          'your reading speed is ${wpm.toInt()} words per minute',
                          style: TextStyle(fontSize: 20),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('got it!'))
                        ],
                      ),
                    );
                  }
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 209, 209, 209),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/speed_test_icon.png',
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'test your reading\nspeed',
                        style: TextStyle(fontSize: 20),
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
                    color: const Color.fromARGB(255, 209, 209, 209),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/dumbbell_icon.png',
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'start improving reading\nspeed',
                        style: TextStyle(fontSize: 20),
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
