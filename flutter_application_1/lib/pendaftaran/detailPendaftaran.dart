import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/pembayaran/detailTagihan.dart';
import 'package:tubes_5_wavecare/pendaftaran/pendaftaran2.dart';

void main() {
  runApp(Pendaftaran3());
}

class Pendaftaran3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detail Pendaftaran',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Pendaftaran2()),
            );
          },
        ),
          title: Center(
            child: Text(
              'Detail Pendaftaran',
              style: TextStyle(
                color: Colors.blue, // Warna biru
                fontSize: 20,
              ),
            ),
          ),
          backgroundColor: Colors.transparent, // Background transparan
          elevation: 0, // Menghapus shadow di bawah app bar
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100], // Warna biru muda untuk kontainer list
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Nama Pasien'),
                      trailing: Text('Raya Cahya'),
                    ),
                    ListTile(
                      title: Text('Nomor Pendaftaran'),
                      trailing: Text('1729 - 1381-11'),
                    ),
                    ListTile(
                      title: Text('Tanggal Pemeriksaan'),
                      trailing: Text('18 Maret 2020'),
                    ),
                    ListTile(
                      title: Text('Jam Pemeriksaan'),
                      trailing: Text('10.00 WIB'),
                    ),
                    ListTile(
                      title: Text('Poli'),
                      trailing: Text('Umum'),
                    ),
                    ListTile(
                      title: Text('Dokter'),
                      trailing: Text('Dr. Dian Ismaya'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => detailTagihan()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[100], // Warna biru muda
                  ),
                  child: Text(
                    'Lanjutkan Pembayaran',
                    style: TextStyle(color: Colors.black), // Teks hitam
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
