import 'package:flutter/material.dart';
import '../models/buku.dart';
import '../services/repository.dart';

class BukuScreen extends StatefulWidget {
  const BukuScreen({super.key});

  @override
  _BukuScreenState createState() => _BukuScreenState();
}

class _BukuScreenState extends State<BukuScreen> {
  final Repository _repository = Repository();
  List<Buku> _bukuList = [];

  @override
  void initState() {
    super.initState();
    _fetchBuku();
  }

  Future<void> _fetchBuku() async {
    final bukuList = await _repository.getBukuList();
    setState(() {
      _bukuList = bukuList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Buku'),
      ),
      body: ListView.builder(
        itemCount: _bukuList.length,
        itemBuilder: (context, index) {
          final buku = _bukuList[index];
          return ListTile(
            title: Text(buku.judul),
            subtitle: Text('Pengarang: ${buku.pengarang}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan logika untuk menambah buku
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
