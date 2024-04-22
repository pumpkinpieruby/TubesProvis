import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5), // Padding horizontal dan vertikal
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), // Border radius
            color: Colors.lightBlue[100], // Warna latar belakang
          ),
          child: Text(
            'Hasil Radiologi',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
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
                  _buildCategoryItem('MRI (11 November 2021)', context),
                  SizedBox(height: 15), // Spasi antara kotak
                  _buildCategoryItem('CT SCAN (9 Januari 2020)', context),
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
              },
              icon: Icon(Icons.navigate_next, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

