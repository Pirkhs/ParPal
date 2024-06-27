import "dart:io";
import "package:parpal/scorecard_data.dart";
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
      userId INTEGER,
      FOREIGN KEY(userId) REFERENCES user(id)
    )
    ''');

    await db.execute('''
    CREATE TABLE users(
      id INTEGER PRIMARY KEY,
      username TEXT,
      password TEXT,
    )
    ''');
  }
  
  Future <List<ScorecardData>> getScorecards() async {
    Database db = await instance.database;
    var scorecards = await db.query("scorecards");
    List<ScorecardData> scorecardList = scorecards.isNotEmpty ? scorecards.map((c) => ScorecardData.fromMap((c))).toList() : [];
    return scorecardList;
  }

  Future <int> addScorecard (ScorecardData scorecardData) async {
    Database db = await instance.database;
    return await db.insert("scorecards", scorecardData.toMap());
  }
}

