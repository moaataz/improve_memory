import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:improve_memory/models/database.dart';
import 'package:improve_memory/models/memory_palace.dart';
import 'package:improve_memory/screens/add_palace_screen.dart';
import 'package:improve_memory/screens/memory_palace_page.dart';
import 'package:path/path.dart';

class MemoryPalaceScreen extends StatefulWidget {
  const MemoryPalaceScreen({Key? key}) : super(key: key);

  @override
  State<MemoryPalaceScreen> createState() => _UnityDemoScreenState();
}

class _UnityDemoScreenState extends State<MemoryPalaceScreen> {
  List<Map<String, dynamic>> memoryPalaces = [];
  void portraitScreen() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void initState() {
    SQLDatabase sqlDatabase = SQLDatabase();
    Future.delayed(Duration.zero, () async {
      memoryPalaces = await sqlDatabase.getMemoryPalaces();
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(memoryPalaces);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'memory palaces',
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: memoryPalaces.length,
        itemBuilder: (ctx, i) {
          final file = Image.file(
            File(
              join(
                memoryPalaces[i]['file_path'],
                '1${memoryPalaces[i]['file_ext']}',
              ),
            ),
          );
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => MemoryPalacePage(
                    memoryPalace: MemoryPalace.fromMap(memoryPalaces[i]),
                  ),
                ),
              );
            },
            child: SizedBox(
              width: double.infinity,
              child: Card(
                child: file,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => AddPalaceScreen()))
              .then((_) {
            setState(() {});
          });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
