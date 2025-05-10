import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class MemoryPalacePage extends StatefulWidget {
  const MemoryPalacePage({super.key});

  @override
  State<MemoryPalacePage> createState() => _MemoryPalacePageState();
}

class _MemoryPalacePageState extends State<MemoryPalacePage> {
  final indices = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
  var index = 0;
  List<Image> get images {
    return [
      for (var i in indices)
        Image.asset(
          'assets/memory_palaces/home-in-nijmegen-nieuw-west/${i + 1}.webp',
        )
    ];
  }

  List<List<Hotspot>> get hotspots {
    return [
      [
        Hotspot(
          latitude: 0,
          longitude: 50,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 1;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
        Hotspot(
          latitude: 0,
          longitude: 5,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 2;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
      ],
      [
        Hotspot(
          latitude: 0,
          longitude: -16,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 0;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
        Hotspot(
          latitude: 0,
          longitude: 55,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 11;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
        Hotspot(
          latitude: -11,
          longitude: 150,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 11;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
      ],
      [
        Hotspot(
          latitude: 0,
          longitude: -120,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 0;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
        Hotspot(
          latitude: 0,
          longitude: -79,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 3;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
        Hotspot(
          latitude: 0,
          longitude: 105,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 5;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
      ],
      [
        Hotspot(
          latitude: 0,
          longitude: -12,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 2;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
        Hotspot(
          latitude: 0,
          longitude: -33,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 4;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
        Hotspot(
          latitude: 0,
          longitude: -87,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 10;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
      ],
      [
        Hotspot(
          latitude: 0,
          longitude: 47,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 3;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
      ],
      [
        Hotspot(
          latitude: 0,
          longitude: -28,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 2;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
      ],
      [
        Hotspot(
          latitude: 0,
          longitude: 17,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 3;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
        Hotspot(
          latitude: -20,
          longitude: 8,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 10;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
      ],
      [
        Hotspot(
          latitude: 0,
          longitude: -150,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 8;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
        Hotspot(
          latitude: -30,
          longitude: -147,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 10;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
      ],
      [
        Hotspot(
          latitude: 0,
          longitude: 35,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 7;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
        Hotspot(
          latitude: -13,
          longitude: 17,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 10;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
      ],
      [
        Hotspot(
          latitude: 0,
          longitude: 2,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 10;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
      ],
      [
        Hotspot(
          latitude: 0,
          longitude: -8,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 6;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
        Hotspot(
          latitude: -25,
          longitude: -177,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 3;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
        Hotspot(
          latitude: 0,
          longitude: 71,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 7;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
        Hotspot(
          latitude: 0,
          longitude: 89,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 8;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
        Hotspot(
          latitude: -13,
          longitude: 118,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 9;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
      ],
      [
        Hotspot(
          latitude: 4,
          longitude: 30,
          widget: GestureDetector(
            onTap: () {
              setState(() {
                index = 1;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ),
      ]
    ];
  }
  // double _getLongitude(int locationIndex){
  //   switch (locationIndex) {
  //     case 0:
  //     return 45.0;
  //     case 1:
  //       return -17;
  //     case 2:
  //     return -120;
  //     default:
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    print(index);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory Palace Map'),
      ),
      body: PanoramaViewer(
        hotspots: hotspots[index],
        onTap: (a, b, c) {
          print('latitude: ' + a.toString());
          print('longitude: ' + b.toString());
        },
        child: images[index],
      ),
    );
  }
}
