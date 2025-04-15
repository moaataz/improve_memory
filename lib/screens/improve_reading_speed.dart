import 'package:flutter/material.dart';

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
        child: Row(
          spacing: 15,
          children: [
            Column(
              spacing: 15,
              children: [
                Container(
                  width: 175,
                  height: 175,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '1234',
                        style: TextStyle(
                            fontSize: 30,
                            color: const Color.fromARGB(255, 133, 54, 244),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'increase eye shot retention from numbers',
                        style: TextStyle(fontSize: 20, color: Colors.brown),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 209, 209, 209),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  width: 175,
                  height: 175,
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/skim_icon.png',
                        width: 100,
                      ),
                      Text(
                        'eye skimming training',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.brown),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 209, 209, 209),
                      borderRadius: BorderRadius.circular(10)),
                ),
                // TODO: هطبق اللي موجود في صفحة 187
                Container(
                  width: 175,
                  height: 175,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/metronome_icon.png',
                          width: 100),
                      Text(
                        'Rhythmic pendulum exercise',
                        style: TextStyle(fontSize: 20, color: Colors.brown),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 209, 209, 209),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
            Column(
              spacing: 15,
              children: [
                Container(
                  width: 175,
                  padding: EdgeInsets.all(8),
                  height: 175,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/note_for_multiple_lines_icon.png',
                        width: 100,
                      ),
                      Text(
                        'increase vertical eye shot retention',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.brown),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 209, 209, 209),
                      borderRadius: BorderRadius.circular(10)),
                ),
                // TODO: هعمل اللي في صفحة 136 من كتاب القراءة السريعة
                Container(
                  width: 175,
                  padding: EdgeInsets.all(8),
                  height: 175,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/zigzag_icon.png',
                        width: 100,
                      ),
                      Text(
                        'zigzag eye movement',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.brown),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 209, 209, 209),
                      borderRadius: BorderRadius.circular(10)),
                )
              ],
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
