import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DaftarDokter()),
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
          MaterialPageRoute(builder: (context) => Pembayaran()),
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
          'Pembayaran', // Mengubah judul menjadi "Pembayaran"
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
          padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // Aksi saat teks "Riwayat Pembayaran" diklik
                  print('Teks "Riwayat Pembayaran" diklik');
                  // Tambahkan aksi lain sesuai kebutuhan
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
                        color: Colors.blue, // Ubah warna teks menjadi biru untuk menunjukkan bisa diklik
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40), // Spasi sebelum info pembayaran
              _buildInfoBox(context),
              SizedBox(height: 20), // Spasi sebelum info BPJS
              _buildBPJSInfo(context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onItemTapped(context, 2),
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
                    onPressed: () => _onItemTapped(context, 0),
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
            // Add similar widgets for other icons and texts
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Aksi saat info box diklik
        print('Info box diklik untuk melihat detail tagihan');
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
            // Add other details here
          ],
        ),
      ),
    );
  }

  Widget _buildBPJSInfo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Aksi saat info box BPJS diklik
        print('Info box BPJS diklik untuk melihat detail BPJS');
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
            // Add other BPJS details here
          ],
        ),
      ),
    );
  }
}
