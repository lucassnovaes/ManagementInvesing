import 'package:managementinvesting/Models/user_model.dart';
import 'package:managementinvesting/settings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UsersRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
        db.execute(SCRIPT_FOLLOWING_CREATE_TABLE);
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

  Future<int> getUserLogin(UserModel user) async {
    int result = 0;
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_USERS_NAME,
          where: "user = ? and password = ?",
          whereArgs: [user.user, user.password]);
      Map<String, Object?> mapRead = maps.first;
      var read = mapRead.values;
      var idUser = read.first;
      result = int.parse(idUser.toString());
      return result;
    } catch (ex) {
      print(ex);
    }
    return result;
  }
}
