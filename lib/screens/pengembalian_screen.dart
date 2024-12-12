import 'package:flutter/material.dart';
import '../models/pengembalian.dart';
import '../services/repository.dart';

class PengembalianScreen extends StatefulWidget {
  const PengembalianScreen({super.key});

  @override
  _PengembalianScreenState createState() => _PengembalianScreenState();
}

class _PengembalianScreenState extends State<PengembalianScreen> {
  final Repository _repository = Repository();
  List<Pengembalian> _pengembalianList = [];

  @override
  void initState() {
    super.initState();
    _fetchPengembalian();
  }

  Future<void> _fetchPengembalian() async {
    final pengembalianList = await _repository.getPengembalianList();
    setState(() {
      _pengembalianList = pengembalianList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pengembalian'),
      ),
      body: ListView.builder(
        itemCount: _pengembalianList.length,
        itemBuilder: (context, index) {
          final pengembalian = _pengembalianList[index];
          return ListTile(
            title: Text('ID Peminjaman: ${pengembalian.peminjamanId}'),
            subtitle: Text(
                'Tanggal Dikembalikan: ${pengembalian.tanggalDikembalikan}\nDenda: ${pengembalian.denda}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan logika untuk menambah pengembalian
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
