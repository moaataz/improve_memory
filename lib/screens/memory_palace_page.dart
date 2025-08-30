import 'dart:io';

import 'package:flutter/material.dart';
import 'package:improve_memory/models/memory_palace.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class MemoryPalacePage extends StatefulWidget {
  const MemoryPalacePage({required this.memoryPalace, super.key});
  final MemoryPalace memoryPalace;
  @override
  State<MemoryPalacePage> createState() => _MemoryPalacePageState();
}

class _MemoryPalacePageState extends State<MemoryPalacePage> {
  bool isBannerShown = true;
  File? shownFile;
  @override
  void initState() {
    shownFile = widget.memoryPalace.filePaths[0];
    if (mounted) {
      setState(() {});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.memoryPalace.title),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isBannerShown = !isBannerShown;
                });
              },
              icon: Icon(isBannerShown
                  ? Icons.remove_red_eye
                  : Icons.remove_red_eye_outlined))
        ],
      ),
      body: Stack(
        children: [
          PanoramaViewer(
            sensitivity: 1.5,
            child: shownFile != null
                ? Image.file(
                    shownFile!,
                  )
                : null,
          ),
          if (isBannerShown)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 5,
                        children: [
                          for (var file in widget.memoryPalace.filePaths)
                            GestureDetector(
                              child: Image.file(file),
                              onTap: () {
                                setState(() {
                                  shownFile = file;
                                });
                              },
                            )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
