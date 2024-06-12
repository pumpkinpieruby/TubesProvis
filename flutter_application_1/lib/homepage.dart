import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/daftarDokter/daftardokter.dart';
import 'package:tubes_5_wavecare/faq/FAQ.dart';
import 'package:tubes_5_wavecare/info/info.dart';
import 'package:tubes_5_wavecare/notivikasi.dart';
import 'package:tubes_5_wavecare/pembayaran/pembayaran.dart';
import 'package:tubes_5_wavecare/pendaftaran/pendaftaran.dart';
import 'package:tubes_5_wavecare/profile/Profile.dart';
import 'package:tubes_5_wavecare/rekamMedis/rekamedis.dart';
import 'kartu.dart';
import 'profilRS.dart';
import 'resepobat.dart';

void main() {
  runApp(homepage());
}

class homepage extends StatelessWidget {
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
  int _selectedIndex = 0; // Indeks item yang sedang dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi ke halaman yang sesuai berdasarkan indeks ikon yang diklik
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
          MaterialPageRoute(builder: (context) => PembayaranPage()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Faq()),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pendaftaran()),
        );
        break;
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => resepobat()),
        );
        break;
      case 7:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => rekamedis()),
        );
        break;
      case 8:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => profilRS()),
        );
        break;
      case 9:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => info()),
        );
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[50],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'CareWave',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.person, color: Colors.black),
                  onPressed: () {
                    // Navigasi ke halaman profil saat ikon profil diklik
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  },
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Notifikasi()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo, user!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Selamat datang di aplikasi kami',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 60,
          crossAxisSpacing: 60,
          padding: EdgeInsets.all(40),
          children: [
            _buildFeatureItem('Pendaftaran', Icons.event_outlined, 5),
            _buildFeatureItem('Resep Obat', Icons.medication_liquid, 6),
            _buildFeatureItem('Rekam Medis', Icons.article_outlined, 7),
            _buildFeatureItem('Profil Rumah Sakit', Icons.business, 8),
            _buildFeatureItem('Informasi Kesehatan', Icons.description_outlined, 9),
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
                    color:
                        _selectedIndex == 0 ? Colors.blue[400] : Colors.black,
                  ),
                  Text(
                    'Beranda',
                    style: TextStyle(
                      color:
                          _selectedIndex == 0 ? Colors.blue[400] : Colors.black,
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
                    color:
                        _selectedIndex == 1 ? Colors.blue[400] : Colors.black,
                  ),
                  Text(
                    'Jadwal Dokter',
                    style: TextStyle(
                      color:
                          _selectedIndex == 1 ? Colors.blue[400] : Colors.black,
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
                    color:
                        _selectedIndex == 2 ? Colors.blue[400] : Colors.black,
                  ),
                  Text(
                    'Pembayaran',
                    style: TextStyle(
                      color:
                          _selectedIndex == 2 ? Colors.blue[400] : Colors.black,
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
                    color:
                        _selectedIndex == 3 ? Colors.blue[400] : Colors.black,
                  ),
                  Text(
                    'FAQ',
                    style: TextStyle(
                      color:
                          _selectedIndex == 3 ? Colors.blue[400] : Colors.black,
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

  Widget _buildFeatureItem(String title, IconData icon, int index) {
    return Card(
      color: Colors.lightBlue[100],
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          _onItemTapped(index); // Panggil fungsi _onItemTapped dengan indeks yang sesuai
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
