import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:improve_memory/screens/memory_palace_page.dart';

class MemoryPalaceScreen extends StatefulWidget {
  const MemoryPalaceScreen({Key? key}) : super(key: key);

  @override
  State<MemoryPalaceScreen> createState() => _UnityDemoScreenState();
}

class _UnityDemoScreenState extends State<MemoryPalaceScreen> {
  void portraitScreen() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'memory palaces',
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // https://my.matterport.com/show/?m=LzWv6sifge9
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (ctx) => MemoryPalacePage(
                          index: 0,
                        ),
                      ),
                    )
                    .then(((_) => portraitScreen()));
              },
              child: Card(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      'assets/memory_palaces/home-in-nijmegen-nieuw-west/1.webp',
                      width: 80,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text('home in nijmegen nieuw west'),
                ),
              )),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => MemoryPalacePage(
                      index: 1,
                    ),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      'assets/memory_palaces/home-in-qafa/1.webp',
                      width: 80,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text('home in qafa'),
                ),
              )),
        ],
      ),
    );
  }
}
