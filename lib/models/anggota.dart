class Anggota {
  int? id;
  String nim;
  String nama;
  String alamat;
  String jenisKelamin;

  Anggota({
    this.id,
    required this.nim,
    required this.nama,
    required this.alamat,
    required this.jenisKelamin,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nim': nim,
      'nama': nama,
      'alamat': alamat,
      'jenis_kelamin': jenisKelamin,
    };
  }

  factory Anggota.fromMap(Map<String, dynamic> map) {
    return Anggota(
      id: map['id'],
      nim: map['nim'],
      nama: map['nama'],
      alamat: map['alamat'],
      jenisKelamin: map['jenis_kelamin'],
    );
  }
}
