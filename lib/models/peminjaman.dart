class Peminjaman {
  int? id;
  String tanggalPinjam;
  String tanggalKembali;
  int anggotaId;
  int bukuId;

  Peminjaman({
    this.id,
    required this.tanggalPinjam,
    required this.tanggalKembali,
    required this.anggotaId,
    required this.bukuId,
  });

  // Mengubah objek ke Map (untuk penyimpanan di database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tanggal_pinjam': tanggalPinjam,
      'tanggal_kembali': tanggalKembali,
      'anggota': anggotaId,
      'buku': bukuId,
    };
  }

  // Mengubah Map dari database ke objek Peminjaman
  factory Peminjaman.fromMap(Map<String, dynamic> map) {
    return Peminjaman(
      id: map['id'],
      tanggalPinjam: map['tanggal_pinjam'],
      tanggalKembali: map['tanggal_kembali'],
      anggotaId: map['anggota'],
      bukuId: map['buku'],
    );
  }
}
