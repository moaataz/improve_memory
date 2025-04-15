import 'package:flutter/material.dart';
import 'package:improve_memory/constants/objects.dart';
import 'package:improve_memory/constants/reading_questions.dart';

class ReadingFastTrainingScreen extends StatefulWidget {
  const ReadingFastTrainingScreen({super.key});

  @override
  State<ReadingFastTrainingScreen> createState() =>
      _ReadingFastTrainingScreenState();
}

class _ReadingFastTrainingScreenState extends State<ReadingFastTrainingScreen> {
  int correct = 0;
  int wrong = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('improving reading speed'),
        backgroundColor: Colors.blue,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'correct: $correct',
                      style: TextStyle(color: Colors.green, fontSize: 22),
                    ),
                    Text(
                      'wrong: $wrong',
                      style: TextStyle(color: Colors.red, fontSize: 22),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  threeLinesQuestions[
                      randomizer.nextInt(threeLinesQuestions.length)],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OpinionButton(
                      add: () {
                        setState(() {
                          correct += 1;
                        });
                      },
                      child: Text(
                        'yes',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    OpinionButton(
                      add: () {
                        setState(() {
                          wrong += 1;
                        });
                      },
                      child: Text(
                        'no',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OpinionButton extends StatelessWidget {
  const OpinionButton({required this.add, required this.child, super.key});
  final void Function() add;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => add(),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
          width: 60,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: child,
        ),
      ),
    );
  }
}
