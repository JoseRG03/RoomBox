import 'package:path/path.dart';
import 'package:room_box_app/models/storage/user-data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  final String _userTableName = 'user';
  final String _userIdColumnName = 'id';
  final String _userJWTColumnName = 'jwt';
  final String _userRefreshColumnName = 'refresh';

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'roombox_db.db');
    final database = await openDatabase(databasePath,
    version: 1,
    onCreate: (db, version) {
      db.execute('''
       CREATE TABLE $_userTableName (
         $_userIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
         $_userJWTColumnName TEXT NOT NULL,
         $_userRefreshColumnName TEXT NOT NULL
       )
      ''');
    },);

    return database;
  }

  void addUserData(String jwt, String refresh) async {
    final db = await database;
    await db.insert(_userTableName, {
      _userIdColumnName: 1,
      _userJWTColumnName: jwt,
      _userRefreshColumnName: refresh
    });
  }

  Future<int> clearUserData() async {
    final db = await database;
    await db.delete(_userTableName);

    return 1;
  }

  Future<UserData> getUserData() async {
    final db = await database;
    final map = await db.rawQuery('SELECT * FROM $_userTableName WHERE id=1');

    return UserData.fromJson(map[0]);
  }
}