import 'package:flutter/material.dart';
import 'package:improve_memory/screens/memory_palace_hotspots.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class MemoryPalacePage extends StatefulWidget {
  const MemoryPalacePage({required this.index, super.key});
  final int index;
  @override
  State<MemoryPalacePage> createState() => _MemoryPalacePageState();
}

class _MemoryPalacePageState extends State<MemoryPalacePage> {
  late MemoryPalaceHotspots _memoryPalaceHotspots;
  void updatePlace(int i) {
    setState(() {
      index = i;
    });
  }

  final List<int> indices = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
  var index = 0;
  List<Image> get images {
    return [
      for (var i in indices)
        Image.asset(
          'assets/memory_palaces/${widget.index == 0 ? _memoryPalaceHotspots.palace1 : _memoryPalaceHotspots.palace2}/${i + 1}.webp',
        )
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
  void initState() {
    _memoryPalaceHotspots = MemoryPalaceHotspots(updatePlace);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(index);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory Palace Map'),
      ),
      body: PanoramaViewer(
        hotspots: widget.index == 0
            ? _memoryPalaceHotspots.hotspots1[index]
            : _memoryPalaceHotspots.hotspots2[index],
        onTap: (a, b, c) {
          print('latitude: ' + b.toString());
          print('longitude: ' + a.toString());
        },
        child: images[index],
      ),
    );
  }
}
