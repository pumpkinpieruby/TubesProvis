import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/homepage.dart';
import 'laboratorium.dart';
import 'radiologi.dart';

void main() {
  runApp(rekamedis());
}

class rekamedis extends StatelessWidget {
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
          'Rekam Medis', // Mengubah judul menjadi "Rekam Medis"
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
            SizedBox(height: 30), // Menambahkan space tinggi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategoryItem(
                      'Radiologi', Icons.science_outlined, context),
                  SizedBox(height: 20), // Spasi antara kotak
                  _buildCategoryItem(
                      'Laboratorium', Icons.biotech_outlined, context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon, BuildContext context) {
    return InkWell(
      onTap: () {
        // Aksi saat kategori diklik
        print('Kategori $title diklik');

        // Tentukan halaman tujuan berdasarkan kategori yang dipilih
        if (title == 'Laboratorium') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => laboratorium()), // Halaman Laboratorium
          );
        } else if (title == 'Radiologi') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => radiologi()), // Halaman Radiologi
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
                Icon(
                  icon,
                  size: 30,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                // Navigasi ke halaman tujuan berdasarkan kategori yang dipilih
                if (title == 'Laboratorium') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => laboratorium()), // Halaman Laboratorium
                  );
                } else if (title == 'Radiologi') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => radiologi()), // Halaman Radiologi
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
