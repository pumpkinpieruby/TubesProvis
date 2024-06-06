import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/pembayaran/detailTagihan.dart';
import 'package:tubes_5_wavecare/pendaftaran/pendaftaran.dart';

void main() {
  runApp(riwayatpendaftaran());
}

class riwayatpendaftaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationHistoryPage(),
    );
  }
}

class RegistrationHistoryPage extends StatefulWidget {
  @override
  _RegistrationHistoryPageState createState() => _RegistrationHistoryPageState();
}

class _RegistrationHistoryPageState extends State<RegistrationHistoryPage> {
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => pendaftaran()));
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
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => detailTagihan()));
                },
                child: Container(
                  width: 400,
                  height: 250,
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
                      _buildTagihanButton(context),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              _buildUnderlinedItalicText('Riwayat Pendaftaran', Colors.red),
              SizedBox(height: 10),
              Container(
                width: 400,
                height: 250,
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

  Widget _buildTagihanButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight, // Mengatur posisi tombol ke pojok kanan atas
      child: Container(
        margin: EdgeInsets.all(10), // Memberikan sedikit ruang di sekitar tombol
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Mengatur sudut tombol menjadi bulat
          color: Colors.blue[200], // Mengatur warna latar belakang tombol
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => detailTagihan()),
            );
          },
          child: Text(
            'Tagihan',
            style: TextStyle(
              color: Colors.black, // Mengatur warna teks tombol menjadi hitam
            ),
          ),
        ),
      ),
    );
  }
}

class TagihanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tagihan'),
      ),
      body: Center(
        child: Text('Ini adalah halaman tagihan'),
      ),
    );
  }
}
