import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class MemoryPalaceHotspots with ChangeNotifier {
  MemoryPalaceHotspots(this.updatePlace);
  void Function(int) updatePlace;
  List<List<Hotspot>> get hotspots1 {
    return [
      [
        Hotspot(
          latitude: 0,
          longitude: 50,
          widget: GestureDetector(
            onTap: () {
              updatePlace(1);
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
              updatePlace(2);
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
              updatePlace(0);
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
              updatePlace(2);
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
              updatePlace(11);
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
              updatePlace(0);
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
              updatePlace(3);
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
              updatePlace(5);
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
              updatePlace(2);
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
              updatePlace(4);
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
              updatePlace(10);
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
              updatePlace(3);
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
              updatePlace(2);
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
              updatePlace(3);
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
              updatePlace(10);
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
              updatePlace(8);
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
              updatePlace(10);
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
              updatePlace(7);
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
              updatePlace(10);
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
              updatePlace(10);
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
              updatePlace(6);
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
              updatePlace(3);
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
              updatePlace(7);
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
              updatePlace(8);
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
              updatePlace(9);
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
              updatePlace(1);
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

  List<List<Hotspot>> get hotspots2 {
    return [[
      
    ]
    ];
  }

  final String palace1 = 'home-in-nijmegen-nieuw-west';
  final String palace2 = 'home-in-qafa';
}
