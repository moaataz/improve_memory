import 'dart:io';

import 'package:path/path.dart';

class MemoryPalace {
  MemoryPalace({
    required this.filePath,
    required this.fileExt,
    required this.id,
    required this.title,
    required this.imagesCount,
    required this.description,
  });
  int id;
  String title;
  String description;
  String filePath;
  String fileExt;
  int imagesCount;

  factory MemoryPalace.fromMap(Map<String, dynamic> json) => MemoryPalace(
        description: json['description'],
        fileExt: json['file_ext'],
        filePath: json['file_path'],
        id: json['Id'],
        imagesCount: json['images_count'],
        title: json['title'],
      );
  List<File> get filePaths => [
        for (var i = 1; i <= imagesCount; i++)
          File(join(filePath, i.toString() + fileExt))
      ];
}
