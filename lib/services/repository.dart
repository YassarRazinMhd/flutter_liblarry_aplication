import '../db/db_helper.dart';
import '../models/anggota.dart';

class Repository {
  final DBHelper _dbHelper = DBHelper();

  Future<int> insertAnggota(Anggota anggota) async {
    final db = await _dbHelper.database;
    return await db.insert('Anggota', anggota.toMap());
  }

  Future<List<Anggota>> getAnggotaList() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('Anggota');

    return List.generate(maps.length, (i) {
      return Anggota.fromMap(maps[i]);
    });
  }

  Future<int> deleteAnggota(int id) async {
    final db = await _dbHelper.database;
    return await db.delete('Anggota', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateAnggota(Anggota anggota) async {
    final db = await _dbHelper.database;
    return await db.update(
      'Anggota',
      anggota.toMap(),
      where: 'id = ?',
      whereArgs: [anggota.id],
    );
  }

  getBukuList() {}

  getPeminjamanList() {}

  getPengembalianList() {}
}
