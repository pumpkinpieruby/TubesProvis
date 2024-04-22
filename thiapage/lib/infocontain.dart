import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ArticlePage(),
    );
  }
}

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Kesehatan Mental di Era Digital',
             style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00A9FF),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Ditinjau oleh dr. Fadhli Rizal Makarim pada 29 Februari 2024',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/mental.jpg', // Path gambar artikel lokal
              height: 250, // Sesuaikan dengan ukuran yang diinginkan
              width: double.infinity, // Maksimalkan lebar gambar
              fit: BoxFit.contain, // Atur agar gambar tidak terlalu besar
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                // Paragraf-paragraf isi artikel
                'Studi tentang kesehatan mental mencatat bahwa di era digital orang lebih berisiko terkena gangguan mental daripada era-era sebelumnya.[13] Beberapa gejala gangguan mental yang paling sering ditemui adalah depresi, kecemasan dan kecanduan. Menurut data WHO, depresi merupakan penyakit yang umum terjadi. Diperkirakan 5 persen populasi dunia menderita gejala depresi. Orang dengan depresi ringan biasanya merasa sedih, kosong, dan kehilangan gairah untuk beraktivitas.\n   Di level depresi sedang yang dirasakan adalah sulit konsentrasi, merasa bersalah, minder, tidak memiliki masa depan, gangguan tidur, dan merasa kelelahan. Pada level akut depresi dapat mendorong si penderita untuk memikirkan bunuh diri. Yang terakhir adalah soal kecanduan. Kecanduan secara medis dapat diartikan sebagai disfungsi kronik pada sistem otak yang melibatkan motivasi, memory dan reward. Orang yang menderita kecanduan biasanya akan bertindak secara kompulsif dan terobsesi untuk mencari reward tanpa bisa mengontrol konsekuensinya. \nDi era digital, jenis kecanduan yang lahir dari budaya layar diantaranya adalah kecanduan game-online, kecanduan judi, kecanduan berbelanja online dan kecanduan pornografi. Keempat jenis kecanduan ini sering kita temui di kalangan remaja dan anak muda. Sampai di sini, kita perlu menggarisbawahi bahwa tiga masalah kesehatan mental tersebut harus menjadi perhatian bersama. Kita tidak ingin kalau generasi masa depan Indonesia gagal merealisasikan potensinya karena terkendala gangguan mental.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
