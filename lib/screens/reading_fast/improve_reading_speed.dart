import 'package:flutter/material.dart';
import 'package:improve_memory/screens/reading_fast/eye_shot_retention.dart';
import 'package:improve_memory/screens/reading_fast/eye_skimming_screen.dart';
import 'package:improve_memory/screens/reading_fast/zigzag_reading.dart';

class ImprovingReadingSpeed extends StatelessWidget {
  const ImprovingReadingSpeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('improving reading speed'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 15,
          children: [
            ExerciseItem(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => IncreaseEyeShotRetentionScreen(),
                  ),
                );
              },
              leading: Text(
                '1234',
                style: TextStyle(
                    fontSize: 30,
                    color: const Color.fromARGB(255, 133, 54, 244),
                    fontWeight: FontWeight.bold),
              ),
              title: 'increase eye shot retention from numbers',
            ),
            ExerciseItem(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => EyeSkimmingScreen(),
                  ),
                );
              },
              leading: Image.asset(
                'assets/images/skim_icon.png',
                width: 100,
              ),
              title: 'eye skimming training',
            ),
            // TODO: هعمل اللي في صفحة 136 من كتاب القراءة السريعة

            ExerciseItem(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => ZigZagReading()));
              },
              leading: Image.asset(
                'assets/images/zigzag_icon.png',
                width: 100,
              ),
              title: 'zigzag eye movement',
            ),
            // TODO: هطبق اللي موجود في صفحة 187
            ExerciseItem(
              onPressed: () {},
              leading: Image.asset(
                'assets/images/metronome_icon.png',
                width: 100,
              ),
              title: 'Rhythmic pendulum exercise',
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({
    super.key,
    required this.onPressed,
    required this.leading,
    required this.title,
  });

  final Widget leading;
  final GestureTapCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(60)),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.horizontal(left: Radius.circular(60)),
        ),
        child: InkWell(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(60)),
          onTap: onPressed,
          child: SizedBox(
            width: double.infinity,
            height: 90,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 35,
                      child: FittedBox(child: leading)),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        title,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
