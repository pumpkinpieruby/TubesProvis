import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/riwayatpendaftaran.dart';
import 'homepage.dart';
import 'ketersediaandokter.dart';

void main() {
  runApp(pendaftaran());
}

class pendaftaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HealthInfoPage(),
    );
  }
}

class HealthInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(228, 255, 255, 255),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            // Navigasi langsung ke halaman homepage saat tombol kembali ditekan
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => homepage()), // Ganti dengan halaman homepage
            );
          },
        ),
        title: Text(
          'Pendaftaran', // Mengubah judul menjadi "Rekam Medis"
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
          children: [
            SizedBox(height: 40), // Menambahkan space tinggi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategoryItem('Jadwalkan Pendaftaran', context),
                  SizedBox(height: 15), // Spasi antara kotak
                  _buildCategoryItem('Riwayat Pendaftaran', context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, BuildContext context) {
  return InkWell(
    onTap: () {
      // Aksi saat kategori diklik
      print('Kategori $title diklik');
      // Implementasikan navigasi ke halaman ketersediaan dokter di sini
      if (title == 'Jadwalkan Pendaftaran') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ketersediaandokter()), // Halaman Laboratorium
        );
      } else if (title == 'Riwayat Pendaftaran') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => riwayatpendaftaran()), // Halaman Radiologi
        );
      }
    },
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.lightBlue[100],
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              // Aksi saat tombol '>' diklik
              print('Tombol ">" untuk kategori $title diklik');
              // Implementasikan navigasi ke halaman ketersediaan dokter di sini
              if (title == 'Jadwalkan Pendaftaran') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ketersediaandokter()), // Halaman Laboratorium
                );
              }else if (title == 'Riwayat Pendaftaran') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => riwayatpendaftaran()), // Halaman Radiologi
                );
              }
            },
            icon: Icon(Icons.navigate_next, color: Colors.black),
          ),
        ],
      ),
    ),
  );
}

}

