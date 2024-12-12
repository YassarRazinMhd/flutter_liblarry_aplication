// ignore: depend_on_referenced_packages

import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? _database;

  DBHelper._internal();

  factory DBHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'perpustakaan.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Anggota (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nim TEXT,
            nama TEXT,
            alamat TEXT,
            jenis_kelamin TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE Buku (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            judul TEXT,
            pengarang TEXT,
            penerbit TEXT,
            tahun_terbit TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE Peminjaman (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            tanggal_pinjam TEXT,
            tanggal_kembali TEXT,
            anggota INTEGER,
            buku INTEGER,
            FOREIGN KEY(anggota) REFERENCES Anggota(id),
            FOREIGN KEY(buku) REFERENCES Buku(id)
          )
        ''');
        await db.execute('''
          CREATE TABLE Pengembalian (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            tanggal_dikembalikan TEXT,
            terlambat INTEGER,
            denda REAL,
            peminjaman INTEGER,
            FOREIGN KEY(peminjaman) REFERENCES Peminjaman(id)
          )
        ''');
      },
    );
  }
  
  getDatabasesPath() {}
  
  openDatabase(String path, {required int version, required Future<Null> Function(dynamic db, dynamic version) onCreate}) {}
}

class Database {
  insert(String s, Map<String, dynamic> map) {}

  query(String s) {}

  delete(String s, {required String where, required List<int> whereArgs}) {}

  update(String s, Map<String, dynamic> map, {required String where, required List<int?> whereArgs}) {}
}
