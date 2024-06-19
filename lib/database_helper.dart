import "dart:io";
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";
import "package:path_provider/path_provider.dart";

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database>  get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "parpal.db");
    return await openDatabase(
      path,
      version: 1, 
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE scorecards(
      id INTEGER PRIMARY KEY,
      date TEXT,
      scores TEXT,
      players TEXT,
      user_id INTEGER,
    )
    ''');

    await db.execute('''
    CREATE TABLE users(
      id INTEGER PRIMARY KEY,
      username TEXT,
      
    )
    ''');
  }
}