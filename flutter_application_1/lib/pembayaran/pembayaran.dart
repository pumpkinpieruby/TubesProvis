import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_5_wavecare/daftarDokter/daftardokter.dart';
import 'package:tubes_5_wavecare/faq/FAQ.dart';
import 'package:tubes_5_wavecare/homepage.dart';
import 'package:tubes_5_wavecare/kartu.dart';
import 'package:tubes_5_wavecare/pembayaran/detailBPJS.dart';
import 'package:tubes_5_wavecare/pembayaran/detailTagihan.dart';

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

class PembayaranPage extends StatefulWidget {
  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  int _selectedIndex = 3; // Indeks item yang sedang dipilih
  List<Map<String, dynamic>> paymentHistory = [];
  String token = ''; // Simpan token setelah login
  int? userId; // Asumsikan kita memiliki user ID setelah login

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token') ?? '';
      userId = prefs.getInt('user_id');
    });

    if (userId != null && token.isNotEmpty) {
      fetchPaymentHistory();
    } else {
      // Handle error: user data not found
      print('User ID or token not found in SharedPreferences');
    }
  }

  Future<void> fetchPaymentHistory() async {
    if (userId == null) return;

    final url = Uri.parse(
        'http://127.0.0.1:8001/pendaftaran/getPaymentHistory/$userId');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        paymentHistory =
            List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    } else {
      print('Failed to fetch payment history');
    }
  }

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
        child: Padding(
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
              ...paymentHistory
                  .map((history) => _buildPaymentInfoBox(history))
                  .toList(),
            ],
          ),
        ),
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
                        _selectedIndex == 3 ? Colors.blue[400] : Colors.black,
                  ),
                  Text(
                    'Pembayaran',
                    style: TextStyle(
                      color:
                          _selectedIndex == 3 ? Colors.blue[400] : Colors.black,
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
                        _selectedIndex == 4 ? Colors.blue[400] : Colors.black,
                  ),
                  Text(
                    'FAQ',
                    style: TextStyle(
                      color:
                          _selectedIndex == 4 ? Colors.blue[400] : Colors.black,
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

  Widget _buildPaymentInfoBox(Map<String, dynamic> history) {
    return GestureDetector(
      onTap: () {
        if (history['bpjs_number'] != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => detailBPJS()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    detailTagihan(idPendaftaran: history['id_pendaftaran'])),
          );
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.lightBlue[100],
          border: Border.all(color: Colors.grey, width: 2.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            history['bpjs_number'] != null
                ? Image.network(
                    'assets/images/bpjs.png',
                    width: 250,
                    height: 40,
                    fit: BoxFit.fill,
                  )
                : Container(),
            SizedBox(height: 20),
            Text(
              'Nama Pasien: ${history['nama_pasien']}',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Nomor Rekam Medis: ${history['nomor_rekam_medis']}',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Tempat Tanggal Lahir: ${history['tanggal_lahir']}',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Tanggal Pembayaran: ${history['tanggal_pembayaran']}',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            history['bpjs_number'] == null
                ? Text(
                    'Total Tagihan: Rp.${history['total_tagihan'].toStringAsFixed(2)}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  )
                : Container(),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  if (history['bpjs_number'] != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => detailBPJS()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => detailTagihan(
                              idPendaftaran: history['id_pendaftaran'])),
                    );
                  }
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
