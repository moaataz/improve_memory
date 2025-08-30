import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLDatabase {
  static final SQLDatabase sqlDatabase = SQLDatabase._internal();
  SQLDatabase._internal();
  factory SQLDatabase() {
    return sqlDatabase;
  }
  Future<Database>? _db;
  Future<Database> get db {
    if (_db == null) {
      _db = databaseInitialize();
      return _db!;
    }
    return _db!;
  }

  Future<Database> databaseInitialize() async {
    final databasesPath = await getDatabasesPath();
    final fullPath = join(databasesPath, 'database.db');

    return openDatabase(fullPath, version: 1, onCreate: onCreate);
  }

  void onCreate(Database db, int version) async {
    final batch = db.batch();
    batch.execute("""
      CREATE TABLE memory_palaces (
          "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          "title" TEXT NOT NULL,
          "file_path" TEXT NOT NULL,
          "images_count" INTEGER,
          "file_ext" TEXT,
          "description" TEXT
    )""");
    await batch.commit();
  }

  Future<List<Map<String, dynamic>>> getMemoryPalaces() async {
    final database = await db;
    return database.rawQuery("SELECT * FROM memory_palaces");
  }

  Future<int> addPlace(
    String title,
    String filePath,
    String description,
    List<File> images,
  ) async {
    final database = await db;
    var folderLocation = await getExternalStorageDirectory();
    folderLocation ??= await getApplicationDocumentsDirectory();
    final directory = await Directory(join(
      folderLocation.path,
      'memory_palaces',
      filePath,
    )).create(recursive: true);
    for (var i = 0; i < images.length; i++) {
      File(join(
        directory.path,
        '${i + 1}${extension(images[i].path)}',
      )).writeAsBytes(await images[i].readAsBytes());
    }
    return database.rawInsert(
      """INSERT INTO memory_palaces(`title`,`file_path`,`description`,`file_ext`,`images_count`) 
      VALUES('$title','${directory.path}','$description','${extension(images[0].path)}',${images.length})""",
    );
  }
}
