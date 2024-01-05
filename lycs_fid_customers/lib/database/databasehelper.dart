import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:lycs_fid_customers/model/client.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "Lycs_fid.db";

  static Future<Database> getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE Client(id TEXT PRIMARY KEY, firstName TEXT NOT NULL,lastName TEXT NOT NULL,email TEXT NOT NULL,password TEXT NOT NULL,confirm_password TEXT NOT NULL,phone TEXT NOT NULL, adresse TEXT, age TEXT, sexe TEXT);"),
        version: _version);
  }

  static Future<int> addClient(Client client) async {
    final db = await getDB();
    return await db.insert("Client", client.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateClient(Client client) async {
    final db = await getDB();
    return await db.update("Client", client.toJson(),
        where: 'id = ?',
        whereArgs: [client.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteClient(Client client) async {
    final db = await getDB();
    return await db.delete(
      "Client",
      where: 'id = ?',
      whereArgs: [client.id],
    );
  }

  static Future<List<Map<String, dynamic>>?> getAllClients() async {
    final db = await getDB();

    final List<Map<String, dynamic>> maps = await db.query("Client");

    if (maps.isEmpty) {
      return null;
    }

    return maps;
  }
}
