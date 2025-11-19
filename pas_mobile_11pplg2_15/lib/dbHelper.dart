import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'favorites.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE favorites(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT)',
        );
      },
    );
  }

  // add
  Future<int> addFavorite(String title) async {
    final client = await db;
    return client.insert("favorites", {"title": title});
  }

  // get
  Future<List<Map<String, dynamic>>> getFavorites() async {
    final client = await db;
    return client.query("favorites", orderBy: "id DESC");
  }

  // delete
  Future<int> deleteFavorite(int id) async {
    final client = await db;
    return client.delete(
      "favorites",
      where: "id = ?",
      whereArgs: [id],
    );
  }
  
}
