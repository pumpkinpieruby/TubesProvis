import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(profilRS());
}

class profilRS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HospitalProfilePage(),
    );
  }
}

class HospitalProfilePage extends StatelessWidget {
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
            // Navigasi langsung ke halaman homepage saat tombol kembali ditekan
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => homepage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(
              'Rumah Sakit CareWave',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00A9FF),
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/RS.png', // Path gambar rumah sakit lokal
              height: 250, // Sesuaikan dengan ukuran yang diinginkan
              width: double.infinity, // Maksimalkan lebar gambar
              fit: BoxFit.contain, // Atur agar gambar tidak terlalu besar
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileItem('Nama Rumah Sakit', 'RS CareWave'),
                  _buildProfileItem('Alamat', 'Jl. Kesehatan No. 123, Kota Sehat'),
                  _buildProfileItem('Telepon', '+62 123 456 789'),
                  _buildProfileItem('Email', 'info@rssehatsentosa.com'),
                  SizedBox(height: 20),
                  Text(
                    // Paragraf sejarah rumah sakit
                    'RS CareWave adalah rumah sakit terkemuka di Kota Sehat yang didirikan pada tahun 1990. Sejak berdiri, RS CareWave telah mendedikasikan dirinya untuk memberikan pelayanan kesehatan terbaik bagi masyarakat. Dengan fasilitas modern dan tenaga medis yang berkualitas, RS CareWave siap memberikan pelayanan terbaik untuk setiap pasien.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '$title:',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
