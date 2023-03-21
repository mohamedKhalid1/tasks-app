import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;

class DbHelper {
  static Database? _db;

  static const String dbName = 'test.db';
  static const String tableUser = 'user';
  static const int version = 1;
  static const String userID = 'user_id';
  static const String userName = 'user_name';
  static const String email = 'email';
  static const String password = 'password';

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);
    var db = await openDatabase(path, version: version, onCreate: onCreate);
    return db;
  }

  onCreate(Database database, int version) async {
    await database.execute("CREATE TABLE $tableUser("
        "$userID TEXT,"
        "$email TEXT,"
        "$password TEXT,"
        "$userName TEXT,"
        "PRIMARY KEY ($userID)"
        ")");
  }
}
