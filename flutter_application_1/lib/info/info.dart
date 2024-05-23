import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/homepage.dart';

void main() {
  runApp(info());
}

class info extends StatelessWidget {
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => homepage()), // Ganti dengan halaman homepage
            );
          },
        ),
        title: Text(
          'Informasi Kesehatan',
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
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          // height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row( 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari Artikel', 
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                    ),
                    border: InputBorder.none, 
                  ),
                ),
              ),
              Icon(Icons.search),
            ],
          ),
        ),
              SizedBox(height: 20),
              _buildArticleContainer(
                imageUrl: 'assets/images/mental.jpg',
                title: 'Kesehatan Mental di Era Digital',
                description: 'Tantangan mental yang muncul seiring perkembangan teknologi digital dan strategi adaptasi yang efektif.',
                context: context
              ),
              SizedBox(height: 20),
              _buildArticleContainer(
                imageUrl: 'assets/images/yoga.jpg',
                title: 'Yoga untuk Kesehatan Fisik dan Mental',
                description: 'Tinjauan manfaat yoga berdasarkan penelitian ilmiah terkini serta panduan praktis memulai latihan yoga.',
                context: context
              ),
              SizedBox(height: 20),
              _buildArticleContainer(
                imageUrl: 'assets/images/food.jpg',
                title: 'Makanan Super untuk Jantung Sehat',
                description: 'Pilihan nutrisi terbaik untuk mendukung fungsi jantung yang optimal dalam pola makan sehari-hari.',
                context: context
              ),
              SizedBox(height: 20),
              _buildArticleContainer(
                imageUrl: 'assets/images/tidur.jpg',
                title: 'Tidur Cukup untuk Kesehatan dan Kinerja',
                description: 'Pentingnya tidur yang memadai dalam menjaga kesehatan dan performa, serta dampak negatif kurang tidur secara teratur.',
                context: context
              ),
              SizedBox(height: 20),
              _buildArticleContainer(
                imageUrl: 'assets/images/stress.jpg',
                title: 'Strategi Pengelolaan Stres',
                description: 'Berbagai cara efektif menghadapi stres rutin dan dampaknya terhadap kesehatan mental.',
                context: context
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleContainer({
    required String imageUrl,
    required String title,
    required String description,
    context
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/isiartikel');
      },
      child: 
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFCDF5FD).withOpacity(0.5), // Latar belakang dengan opacity 50%
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.all(10), // Padding di dalam kontainer
      margin: EdgeInsets.symmetric(vertical: 8), // Jarak antar kontainer
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100, // Lebar gambar
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10), // Jarak antara gambar dan teks
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5), // Jarak antara judul dan deskripsi
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),);
  }
}
