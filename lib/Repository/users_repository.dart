import 'package:managementinvesting/Models/user_model.dart';
import 'package:managementinvesting/settings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UsersRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
        return db.execute(SCRIPT_USERS_CREATE_TABLE);
      },
      version: 1,
    );
  }

  Future create(UserModel model) async {
    try {
      final Database db = await _getDatabase();

      await db.insert(
        TABLE_USERS_NAME,
        model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<bool> getUserLogin(UserModel user) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_USERS_NAME,
          where: "user = ? and password = ?",
          whereArgs: [user.user, user.password]);

      if (maps.length > 0)
        return true;
      else
        return false;
    } catch (ex) {
      print(ex);
    }
    return false;
  }
}
