import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/FAQ.dart';
import 'daftardokter.dart';
import 'homepage.dart';
import 'kartu.dart';

void main() {
  runApp(pembayaran());
}

class pembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PembayaranPage(),
    );
  }
}

class PembayaranPage extends StatelessWidget {
  int _selectedIndex = 0; // Indeks item yang sedang dipilih
  void _onItemTapped(BuildContext context, int index) {
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
        MaterialPageRoute(builder: (context) => daftardokter()),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => kartu()),
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
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(228, 255, 255, 255),
        title: Text(
          'Pembayaran',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Teks "Riwayat Pembayaran" diklik');
                      // Implement action here
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.history,
                          size: 30,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Riwayat Pembayaran',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  _buildInfoBox(context),
                  SizedBox(height: 20),
                  _buildBPJSInfo(context),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onItemTapped(context, 0),
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
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () => _onItemTapped(context, 0),
                color: _selectedIndex == 0 ? Colors.blue[400] : Colors.black,
              ),
              IconButton(
                icon: Icon(Icons.today_outlined),
                onPressed: () => _onItemTapped(context, 1),
                color: _selectedIndex == 1 ? Colors.blue[400] : Colors.black,
              ),
              IconButton(
                icon: Icon(Icons.account_balance_wallet),
                onPressed: () => _onItemTapped(context, 3),
                color: _selectedIndex == 2 ? Colors.blue[400] : Colors.black,
              ),
              IconButton(
                icon: Icon(Icons.chat),
                onPressed: () => _onItemTapped(context, 4),
                color: _selectedIndex == 3 ? Colors.blue[400] : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Info box diklik untuk melihat detail tagihan');
        // Implement action here
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.lightBlue[100],
          border: Border.all(color: Colors.grey, width: 2.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informasi Pembayaran',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nama Pasien: John Doe',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Nomor Rekam Medis: 1729 - 1381- 11',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Tempat Tanggal Lahir: Jakarta, 01 Januari 1990',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Tanggal Pembayaran: 18 Mei 2022',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  print('Teks "Klik Untuk Melihat Detail Tagihan" diklik');
                  // Implement action here
                },
                child: Text(
                  'Klik Untuk Melihat Detail Tagihan',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBPJSInfo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Info box BPJS diklik untuk melihat detail BPJS');
        // Implement action here
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.lightBlue[100],
          border: Border.all(color: Colors.grey, width: 2.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'assets/images/bpjs.png', // Path gambar BPJS dari asset
              width: 250,
              height: 40,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20),
            Text(
              'Informasi Pembayaran',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nomor BPJS: 987654321',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Nama Pasien: John Doe',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Nomor Rekam Medis: 123456789',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Tempat Tanggal Lahir: Jakarta, 01 Januari 1990',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Tanggal Pembayaran: 20 April 2024',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  print('Teks "Klik Untuk Melihat Detail Tagihan" diklik');
                  // Implement action here
                },
                child: Text(
                  'Klik Untuk Melihat Detail Tagihan',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
