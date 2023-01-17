import 'package:managementinvesting/Models/user_model.dart';
import 'package:managementinvesting/settings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FollowingRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
        return db.execute(SCRIPT_FOLLOWING_CREATE_TABLE);
      },
      version: 1,
    );
  }

  Future create(String symbol, int userId) async {
    try {
      final Database db = await _getDatabase();

      await db.insert(
        TABLE_FOLLOWING_NAME,
        {'symbol': symbol, 'userId': userId},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
