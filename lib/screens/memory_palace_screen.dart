import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:improve_memory/screens/memory_palace_page.dart';
import 'package:improve_memory/screens/memory_palace_view.dart';

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
      body: GridView(
        padding: EdgeInsets.all(8),
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
        children: [
          // https://my.matterport.com/show/?m=LzWv6sifge9
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (ctx) => MemoryPalacePage(),
                    ),
                  )
                  .then(((_) => portraitScreen()));
            },
            child: Container(
              width: 200,
              margin: EdgeInsets.all(4),
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/memory_palaces/home-in-nijmegen-nieuw-west/1.webp'),
                      fit: BoxFit.cover)),
            ),
          ),
          // https://my.matterport.com/show/?m=QuDh5vS9ZFh&brand=0
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (ctx) => MemoryPalaceView(
                          url:
                              'https://my.matterport.com/show/?m=QuDh5vS9ZFh&brand=0'),
                    ),
                  )
                  .then(((_) => portraitScreen()));
            },
            child: Container(
              width: 200,
              margin: EdgeInsets.all(4),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage('assets/memory_palaces/2.webp'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          // https://my.matterport.com/show/?m=nE7FU2qGDS2
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (ctx) => MemoryPalaceView(
                          url: 'https://my.matterport.com/show/?m=nE7FU2qGDS2'),
                    ),
                  )
                  .then((_) => portraitScreen());
            },
            child: Container(
              width: 200,
              margin: EdgeInsets.all(4),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage('assets/memory_palaces/3.webp'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
