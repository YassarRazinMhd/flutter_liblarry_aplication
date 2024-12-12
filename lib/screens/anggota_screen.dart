import 'package:flutter/material.dart';
import '../models/anggota.dart';
import '../services/repository.dart';

class AnggotaScreen extends StatefulWidget {
  const AnggotaScreen({super.key});

  @override
  _AnggotaScreenState createState() => _AnggotaScreenState();
}

class _AnggotaScreenState extends State<AnggotaScreen> {
  final Repository _repository = Repository();
  List<Anggota> _anggotaList = [];

  @override
  void initState() {
    super.initState();
    _fetchAnggota();
  }

  Future<void> _fetchAnggota() async {
    final anggotaList = await _repository.getAnggotaList();
    setState(() {
      _anggotaList = anggotaList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Anggota')),
      body: ListView.builder(
        itemCount: _anggotaList.length,
        itemBuilder: (context, index) {
          final anggota = _anggotaList[index];
          return ListTile(
            title: Text(anggota.nama),
            subtitle: Text(anggota.nim),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambah anggota baru
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
