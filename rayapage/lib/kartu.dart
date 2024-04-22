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

class HealthInfoPage extends StatefulWidget {
  @override
  _HealthInfoPageState createState() => _HealthInfoPageState();
}

class _HealthInfoPageState extends State<HealthInfoPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
              child: Center(
                child: Image.asset(
                  'assets/kartu.png', 
                  width: 500, 
                  height: 500,
                  fit: BoxFit.contain, // Sesuaikan tipe fitting gambar
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi saat floating action button ("Kartu") diklik
          print('Floating Action Button ("Kartu") diklik');
        },
        child: Icon(Icons.credit_card),
        backgroundColor: Colors.lightBlue[100], // Warna yang sama dengan elemen di atasnya
        foregroundColor: Colors.black, // Warna ikon
        elevation: 2.0, // Tinggi bayangan
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Membuat bentuk bulat
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
          SizedBox(width: 16), // Tambahkan jarak horizontal
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
        color: Colors.lightBlue[100], // Warna latar belakang kotak
        elevation: 1, // Elevasi kotak
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Bentuk bulat kotak
        ),
        child: InkWell(
          onTap: () {
            // Aksi saat kotak diklik
            print('Kotak $title diklik');
          },
          child: Padding(
            padding: EdgeInsets.all(8), // Mengurangi padding menjadi 8
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 65,
                  color: Colors.white, // Warna ikon
                ),
                SizedBox(height: 5), // Spasi kecil antara ikon dan teks
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Warna teks
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}