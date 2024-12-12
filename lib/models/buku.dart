class Buku {
  int? id;
  String judul;
  String pengarang;
  String penerbit;
  String tahunTerbit;

  Buku({
    this.id,
    required this.judul,
    required this.pengarang,
    required this.penerbit,
    required this.tahunTerbit,
  });

  // Mengubah objek ke Map (untuk penyimpanan di database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'judul': judul,
      'pengarang': pengarang,
      'penerbit': penerbit,
      'tahun_terbit': tahunTerbit,
    };
  }

  // Mengubah Map dari database ke objek Buku
  factory Buku.fromMap(Map<String, dynamic> map) {
    return Buku(
      id: map['id'],
      judul: map['judul'],
      pengarang: map['pengarang'],
      penerbit: map['penerbit'],
      tahunTerbit: map['tahun_terbit'],
    );
  }
}
