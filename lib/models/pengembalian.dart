class Pengembalian {
  int? id;
  String tanggalDikembalikan;
  int terlambat;
  double denda;
  int peminjamanId;

  Pengembalian({
    this.id,
    required this.tanggalDikembalikan,
    required this.terlambat,
    required this.denda,
    required this.peminjamanId,
  });

  // Mengubah objek ke Map (untuk penyimpanan di database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tanggal_dikembalikan': tanggalDikembalikan,
      'terlambat': terlambat,
      'denda': denda,
      'peminjaman': peminjamanId,
    };
  }

  // Mengubah Map dari database ke objek Pengembalian
  factory Pengembalian.fromMap(Map<String, dynamic> map) {
    return Pengembalian(
      id: map['id'],
      tanggalDikembalikan: map['tanggal_dikembalikan'],
      terlambat: map['terlambat'],
      denda: map['denda'],
      peminjamanId: map['peminjaman'],
    );
  }
}
