import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tubes_5_wavecare/daftarDokter/daftardokter.dart';
import 'package:tubes_5_wavecare/faq/FAQ.dart';
import 'package:tubes_5_wavecare/pembayaran/pembayaran.dart';
import 'dart:convert';
import 'homepage.dart';
import 'notivikasi.dart'; // Import halaman notifikasi

void main() {
  runApp(Kartu());
}

class Kartu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HealthInfoPage(),
    );
  }
}

class HealthInfoPage extends StatefulWidget {
  @override
  _HealthInfoPageState createState() => _HealthInfoPageState();
}

class _HealthInfoPageState extends State<HealthInfoPage> {
  int _selectedIndex = 2; 
  int? _nomorAntrean; 

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => homepage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DaftarDokterApp()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Kartu()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pembayaran()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Faq()),
        );
        break;
      default:
        break;
    }
  }

  Future<void> _getAntrean() async {
    final url = Uri.parse('http://127.0.0.1:8001/antrean/random/');
    try {
      final response = await http.post(url);
      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        final nomorAntrean = data['nomor_antrean'];
        setState(() {
          _nomorAntrean = nomorAntrean;
        });

        // Navigate to Notifikasi page with antrean
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Notifikasi(nomorAntrean: _nomorAntrean), // Menambahkan parameter nomorAntrean
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal mendapatkan antrean'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            alignment: Alignment.center,
            child: RotatedBox(
              quarterTurns: -1,
              child: Text(
                'Kartu Pasien',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          VerticalDivider(
            width: 20,
            thickness: 1,
            color: Colors.black,
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/kartu.png',
                    width: 500,
                    height: 500,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _getAntrean, 
                    child: Text('Dapatkan Antrean'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, 
                      foregroundColor: Colors.white, 
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  if (_nomorAntrean != null)
                    Text(
                      'Nomor Antrean Anda: $_nomorAntrean',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onItemTapped(2),
        child: Icon(Icons.credit_card),
        backgroundColor: Colors.lightBlue[100],
        foregroundColor: Colors.black,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 100,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () => _onItemTapped(0),
                    color: _selectedIndex == 0 ? Colors.blue[400] : Colors.black,
                  ),
                  Text(
                    'Beranda',
                    style: TextStyle(
                      color: _selectedIndex == 0 ? Colors.blue[400] : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.today_outlined),
                    onPressed: () => _onItemTapped(1),
                    color: _selectedIndex == 1 ? Colors.blue[400] : Colors.black,
                  ),
                  Text(
                    'Jadwal Dokter',
                    style: TextStyle(
                      color: _selectedIndex == 1 ? Colors.blue[400] : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.account_balance_wallet),
                    onPressed: () => _onItemTapped(3),
                    color: _selectedIndex == 3 ? Colors.blue[400] : Colors.black,
                  ),
                  Text(
                    'Pembayaran',
                    style: TextStyle(
                      color: _selectedIndex == 3 ? Colors.blue[400] : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.chat),
                    onPressed: () => _onItemTapped(4),
                    color: _selectedIndex == 4 ? Colors.blue[400] : Colors.black,
                  ),
                  Text(
                    'FAQ',
                    style: TextStyle(
                      color: _selectedIndex == 4 ? Colors.blue[400] : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String title, IconData icon) {
    return Card(
      color: Colors.lightBlue[100], 
      elevation: 1, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          print('Kotak $title diklik');
        },
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 65,
                color: Colors.white, 
              ),
              SizedBox(height: 5),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
