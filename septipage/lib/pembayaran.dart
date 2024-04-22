import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PembayaranPage(),
    );
  }
}

class PembayaranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(228, 255, 255, 255),
        title: Text(
          'Pembayaran', // Mengubah judul menjadi "Rekam Medis"
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00A9FF),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Aksi saat teks "Riwayat Pembayaran" diklik
                      print('Teks "Riwayat Pembayaran" diklik');
                      // Tambahkan aksi lain sesuai kebutuhan
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.history,
                          size: 30,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Riwayat Pembayaran',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue, // Ubah warna teks menjadi biru untuk menunjukkan bisa diklik
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40), // Spasi sebelum info pembayaran
                  _buildInfoBox(context),
                  SizedBox(height: 20), // Spasi sebelum info BPJS
                  _buildBPJSInfo(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Aksi saat info box diklik
        print('Info box diklik untuk melihat detail tagihan');
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.lightBlue[100],
          border: Border.all(color: Colors.grey, width: 2.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informasi Pembayaran',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nama Pasien: John Doe',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Nomor Rekam Medis: 1729 - 1381- 11',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Tempat Tanggal Lahir: Jakarta, 01 Januari 1990',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Tanggal Pembayaran: 18 Mei 2022',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // Aksi saat teks "Klik Untuk Melihat Detail Tagihan" diklik
                  print('Teks "Klik Untuk Melihat Detail Tagihan" diklik');
                },
                child: Text(
                  'Klik Untuk Melihat Detail Tagihan',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBPJSInfo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Aksi saat info box BPJS diklik
        print('Info box BPJS diklik untuk melihat detail BPJS');
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.lightBlue[100],
          border: Border.all(color: Colors.grey, width: 2.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'assets/images/bpjs.png', // Path gambar BPJS dari asset
              width: 250,
              height: 40,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20),
            Text(
              'Informasi Pembayaran',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nomor BPJS: 987654321',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Nama Pasien: John Doe',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Nomor Rekam Medis: 123456789',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Tempat Tanggal Lahir: Jakarta, 01 Januari 1990',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Tanggal Pembayaran: 20 April 2024',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // Aksi saat teks "Klik Untuk Melihat Detail Tagihan" diklik
                  print('Teks "Klik Untuk Melihat Detail Tagihan" diklik');
                },
                child: Text(
                  'Klik Untuk Melihat Detail Tagihan',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

