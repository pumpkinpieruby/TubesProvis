import 'package:flutter/material.dart';

class DetailDokterPage extends StatelessWidget {
  final String namaDokter;
  final String spesialis;
  final double rating;
  final String nomorStr;
  final List<String> riwayatPendidikan;
  final List<String> riwayatPraktik;

  DetailDokterPage({
    required this.namaDokter,
    required this.spesialis,
    required this.rating,
    required this.nomorStr,
    required this.riwayatPendidikan,
    required this.riwayatPraktik,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Detail Dokter')), // Judul di tengah
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                Icons.person,
                size: 80.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: Text(
                namaDokter,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: Text(
                spesialis,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 24.0),
            // Kotak untuk Nomor STR
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.lightBlue[100], // Warna biru muda
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nomor STR',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    nomorStr,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            // Kotak untuk Riwayat Pendidikan
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.lightBlue[100], // Warna biru muda
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Riwayat Pendidikan',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: riwayatPendidikan.map((pendidikan) {
                      return Text(
                        '- $pendidikan',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            // Kotak untuk Riwayat Praktik
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.lightBlue[100], // Warna biru muda
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Riwayat Praktik',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: riwayatPraktik.map((praktik) {
                      return Text(
                        '- $praktik',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            // Kotak untuk Jadwal Praktik
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.lightBlue[100], // Warna biru muda
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jadwal Praktik',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Aksi saat tombol 'Senin' ditekan
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => JadwalPraktikPage(hari: 'Senin')),
                          );
                        },
                        child: Text(
                          'Senin',
                          style: TextStyle(color: Colors.black), // Warna teks hitam
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Aksi saat tombol 'Rabu' ditekan
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => JadwalPraktikPage(hari: 'Rabu')),
                          );
                        },
                        child: Text(
                          'Rabu',
                          style: TextStyle(color: Colors.black), // Warna teks hitam
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JadwalPraktikPage extends StatelessWidget {
  final String hari;

  JadwalPraktikPage({required this.hari});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Praktik'),
      ),
      body: Center(
        child: Text('Jadwal Praktik untuk Hari $hari'),
      ),
    );
  }
}
