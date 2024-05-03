import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLHelper {
  static final SQLHelper sql = SQLHelper._init();
  SQLHelper._init();

  Future<Database> get database async {
    return await _initDB();
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'counter.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE IF NOT EXISTS counter(count INTEGER PRIMARY KEY)',
        );
        // await db.execute(
        //   'CREATE TABLE IF NOT EXISTS counter(count INTEGER PRIMARY KEY)',
        // );
      },
    );
  }

  Future<bool> counterExists() async {
    final db = await database;
    final result = await db.rawQuery("SELECT * FROM counter");
    if (result.isEmpty) {
      return false;
    }
    return true;
  }

  void createCounter() async {
    final db = await database;
    await db.rawInsert("INSERT INTO counter(count) VALUES(?)", [0]);
    db.close();
  }

  Future<void> updateCounter(int value) async {
    final db = await database;
    await db.rawUpdate("UPDATE counter SET count=?", [value]);
    db.close();
  }

  Future<int> getCounter() async {
    final db = await database;
    final result = await db.rawQuery("SELECT * FROM counter");
    if (result.isNotEmpty) {
      return result[0]['count'] as int;
    }
    return 0;
  }
}
