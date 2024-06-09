import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tubes_5_wavecare/pembayaran/detailTagihan.dart';
import 'package:tubes_5_wavecare/pendaftaran/pendaftaran.dart';

void main() {
  runApp(RiwayatPendaftaranApp());
}

class RiwayatPendaftaranApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationHistoryPage(),
    );
  }
}

class RegistrationHistoryPage extends StatefulWidget {
  @override
  _RegistrationHistoryPageState createState() =>
      _RegistrationHistoryPageState();
}

class _RegistrationHistoryPageState extends State<RegistrationHistoryPage> {
  List<Map<String, dynamic>> riwayatPendaftaran = [];
  Map<String, dynamic>? activePendaftaran;
  String token = ''; // Simpan token setelah login
  int userId = 1; // Asumsikan kita memiliki user ID setelah login

  @override
  void initState() {
    super.initState();
    fetchPendaftaran(); // Panggil fungsi fetchPendaftaran untuk mengambil data riwayat pendaftaran
  }

  Future<void> fetchPendaftaran() async {
    await fetchActivePendaftaran();
    await fetchRiwayatPendaftaran();
  }

  Future<void> fetchActivePendaftaran() async {
    final url = Uri.parse(
        'http://127.0.0.1:8001/pendaftaran/getActivePendaftaran/$userId');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        activePendaftaran = json.decode(response.body);
      });
    } else {
      print('Failed to fetch active registration');
      print(response.body); // Log respons untuk debugging
    }
  }

  Future<void> fetchRiwayatPendaftaran() async {
    final url = Uri.parse(
        'http://127.0.0.1:8001/pendaftaran/getAllPendaftaran/$userId');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        riwayatPendaftaran =
            List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    } else {
      print('Failed to fetch registration history');
      print(response.body); // Log respons untuk debugging
    }
  }

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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => pendaftaran()));
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
              _buildUnderlinedItalicText(
                  'Pendaftaran yang Aktif', Colors.green),
              SizedBox(height: 10),
              activePendaftaran != null
                  ? _buildPendaftaranCard(activePendaftaran!)
                  : Text('No active registration found'),
              SizedBox(height: 30),
              _buildUnderlinedItalicText('Riwayat Pendaftaran', Colors.red),
              SizedBox(height: 10),
              ...riwayatPendaftaran
                  .map((pendaftaran) => _buildPendaftaranCard(pendaftaran))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPendaftaranCard(Map<String, dynamic> pendaftaran) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => detailTagihan(idPendaftaran: 1)));
      },
      child: Container(
        width: 400,
        height: 250,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFFA0E9FF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildRegistrationData('Nama Pasien', pendaftaran['nama_pasien']),
            _buildRegistrationData(
                'Nomor Rekam Medis', pendaftaran['id_pendaftaran'].toString()),
            _buildRegistrationData(
                'Tanggal Pemeriksaan', pendaftaran['tanggal']),
            _buildRegistrationData('Jam Pemeriksaan', pendaftaran['jam']),
            _buildRegistrationData('Poli', pendaftaran['poli']),
            _buildRegistrationData('Nama Dokter', pendaftaran['nama_dokter']),
            _buildRegistrationData('Tanggal Pendaftaran', pendaftaran['hari']),
            _buildTagihanButton(context),
          ],
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
        mainAxisAlignment:
            MainAxisAlignment.start, // Mengatur posisi teks ke kiri
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
      alignment:
          Alignment.topRight, // Mengatur posisi tombol ke pojok kanan atas
      child: Container(
        margin:
            EdgeInsets.all(10), // Memberikan sedikit ruang di sekitar tombol
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(10), // Mengatur sudut tombol menjadi bulat
          color: Colors.blue[200], // Mengatur warna latar belakang tombol
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => detailTagihan(idPendaftaran: 1)),
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
