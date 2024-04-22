import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationHistoryPage(),
    );
  }
}

class RegistrationHistoryPage extends StatelessWidget {
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
            // Aksi saat tombol kembali ditekan
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Riwayat Pendaftaran',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00A9FF),
                ),
              ),
              SizedBox(height: 30),
              _buildUnderlinedItalicText('Pendaftaran yang Aktif', Colors.green),
              SizedBox(height: 10),
              Container(
                width: 356,
                height: 204,
                decoration: BoxDecoration(
                  color: Color(0xFFA0E9FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildRegistrationData('Nama Pasien', 'John Doe'),
                    _buildRegistrationData('Nomor Rekam Medis', '123456789'),
                    _buildRegistrationData('Tanggal Pemeriksaan', '20 April 2024'),
                    _buildRegistrationData('Jam Pemeriksaan', '09:00'),
                    _buildRegistrationData('Poli', 'Umum'),
                    _buildRegistrationData('Nama Dokter', 'Dr. Jane Smith'),
                    _buildRegistrationData('Tanggal Pendaftaran', '18 April 2024'),
                  ],
                ),
              ),
              SizedBox(height: 30),
              _buildUnderlinedItalicText('Riwayat Pendaftaran', Colors.red),
              SizedBox(height: 10),
              Container(
                width: 356,
                height: 204,
                decoration: BoxDecoration(
                  color: Color(0xFFA0E9FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildRegistrationData('Nama Pasien', 'Jane Doe'),
                    _buildRegistrationData('Nomor Rekam Medis', '987654321'),
                    _buildRegistrationData('Tanggal Pemeriksaan', '15 April 2024'),
                    _buildRegistrationData('Jam Pemeriksaan', '11:30'),
                    _buildRegistrationData('Poli', 'Gigi'),
                    _buildRegistrationData('Nama Dokter', 'Dr. John Smith'),
                    _buildRegistrationData('Tanggal Pendaftaran', '12 April 2024'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegistrationData(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title:',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Colors.black,
            ),
          ),
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
    Widget _buildUnderlinedItalicText(String text, Color color) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Mengatur posisi teks ke kiri
          children: [
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.left, // Mengatur teks ke kiri
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: color,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      );
    }

}
