import 'package:flutter/material.dart';
import '../models/peminjaman.dart';
import '../services/repository.dart';


class PeminjamanScreen extends StatefulWidget {
  const PeminjamanScreen({super.key});

  @override
  _PeminjamanScreenState createState() => _PeminjamanScreenState();
}

class _PeminjamanScreenState extends State<PeminjamanScreen> {
  final Repository _repository = Repository();
  List<Peminjaman> _peminjamanList = [];

  @override
  void initState() {
    super.initState();
    _fetchPeminjaman();
  }

  Future<void> _fetchPeminjaman() async {
    final peminjamanList = await _repository.getPeminjamanList();
    setState(() {
      _peminjamanList = peminjamanList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Peminjaman'),
      ),
      body: ListView.builder(
        itemCount: _peminjamanList.length,
        itemBuilder: (context, index) {
          final peminjaman = _peminjamanList[index];
          return ListTile(
            title: Text('ID Anggota: ${peminjaman.anggotaId}'),
            subtitle: Text(
                'Tanggal Pinjam: ${peminjaman.tanggalPinjam}\nTanggal Kembali: ${peminjaman.tanggalKembali}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan logika untuk menambah peminjaman
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
