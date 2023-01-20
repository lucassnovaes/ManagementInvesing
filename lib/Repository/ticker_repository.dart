import 'package:managementinvesting/Models/user_model.dart';
import 'package:managementinvesting/settings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Models/acao.dart';

class TickerRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
        return db.execute(SCRIPT_FOLLOWING_CREATE_TABLE);
      },
      version: 1,
    );
  }

  Future<List<AcaoModel>> getTickersUsers(int user) async {
    int result = 0;
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(
          TABLE_FOLLOWING_NAME,
          where: "usersId = ?",
          whereArgs: [user.toString()]);

      return List.generate(maps.length, (i) {
        return AcaoModel(acao: maps[i]['symbol']);
      });
    } catch (ex) {
      print(ex);
      throw ex;
    }
  }
}
