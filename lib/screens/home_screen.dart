import 'package:flutter/material.dart';
import 'package:improve_memory/screens/flipping_cards_screen.dart';
import 'package:improve_memory/screens/focus_screen.dart';
import 'package:improve_memory/screens/math_calculation_screen.dart';
import 'package:improve_memory/screens/memory_palace_screen.dart';
import 'package:improve_memory/screens/reading_fast/reading_fast_screen.dart';
import 'package:improve_memory/widgets/screen_card.dart';
import 'package:path_provider/path_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('how to use this app?'),
                  content: Text(
                    'card game:\n you will memorise cards with correct arrangement and their elements\nfocus session:\nyou will choose time to focus on phone in minutes and hours then start and there will be tree grown gradually\nmemory palaces:\nhere you will select any place (you should have internet wifi recommended) andget used in it for memorising and use the place as memory palace so you will imagine piece of information as it\'s inside this memory palace niether on written paper or vivid image\nreading fast:\nhere you will skim on question then trying to answer with yes or no we know that making fast reading practice on yes/no questions is very effective way\nmath questions:\nhere you will try to calculate in mind by making calculated result be done automatically',
                  ),
                ),
              );
            },
            icon: Icon(Icons.info),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 10,
          ),
          children: [
            ScreenCard(
              imagePath: 'assets/images/card_game_icon.png',
              title: 'start a memory quiz',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => FlippingCardsScreen(),
                  ),
                );
              },
            ),
            ScreenCard(
              imagePath: 'assets/images/focus_icon.png',
              title: 'start a focus session',
              onPressed: () {
                Navigator.of(
                  context,
                ).push(
                  MaterialPageRoute(
                    builder: (ctx) => FocusScreen(),
                  ),
                );
              },
            ),
            ScreenCard(
              imagePath: 'assets/images/castle-fortress.png',
              title: 'memory palaces',
              onPressed: () {
                Navigator.of(
                  context,
                ).push(
                  MaterialPageRoute(
                    builder: (ctx) => MemoryPalaceScreen(),
                  ),
                );
              },
            ),
            ScreenCard(
              imagePath: 'assets/images/books_icon.png',
              title: 'train on reading fast',
              onPressed: () {
                Navigator.of(
                  context,
                ).push(
                  MaterialPageRoute(
                    builder: (ctx) => ReadingFastScreen(),
                  ),
                );
              },
            ),
            ScreenCard(
              imagePath: 'assets/images/calculator_icon.png',
              title: 'train on mathemtical questions',
              onPressed: () {
                Navigator.of(
                  context,
                ).push(
                  MaterialPageRoute(
                    builder: (ctx) => MathCalculationScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
