import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/daftarDokter/daftardokter.dart';
import 'package:tubes_5_wavecare/faq/detailFAQ.dart';
import 'package:tubes_5_wavecare/homepage.dart';
import 'package:tubes_5_wavecare/kartu.dart';
import 'package:tubes_5_wavecare/pembayaran/pembayaran.dart';

void main() {
  runApp(const Faq());
}

class Faq extends StatelessWidget {
  const Faq({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      routes: {
        "/isidetailfaqnyadisini": (context) => detailFAQ(),
      },
      home: const MyHomePage(title: 'FAQ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 4;
  late List<String> faqList;
  late List<String> filteredFaqList;

  @override
  void initState() {
    super.initState();
    // Inisialisasi daftar pertanyaan FAQ
    faqList = [
      'Bagaimana Cara Mengubah Kata Sandi?',
      'Bagaimana Cara Membuat Janji Temu?',
      'Bagaimana Cara Pendaftaran Pasien?',
      'Bagaimana Cara Melihat Rincian Tagihan?',
      'Bagaimana Cara Melihat Jadwal Dokter?',
      'Apakah Bisa Membayar Tagihan Rumah Sakit?',
      'Apakah Ada Tutorial Penggunaan Aplikasi?',
    ];
    filteredFaqList = List.from(faqList);
  }

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
        break;
    }
  }

  void _searchFaq(String query) {
    setState(() {
      filteredFaqList = faqList
          .where((faq) => faq.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                TextField(
                  onChanged: _searchFaq, // Panggil fungsi pencarian saat input berubah
                  decoration: InputDecoration(
                    hintText: 'Cari Pertanyaan',
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontFamily: 'Poppins'),
                    filled: true,
                    fillColor: Color.fromARGB(255, 183, 181, 181),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Icon(Icons.search, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: filteredFaqList.map((faq) {
                    return Column(
                      children: [
                        _buildFaqItem(faq),
                        SizedBox(height: 20), // Berikan jarak antar box container
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
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

  Widget _buildFaqItem(String question) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/isidetailfaqnyadisini");
      },
      child: Container(
        height: 60,
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 174, 216, 251),
          border: Border.all(color: Colors.lightBlue),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/isidetailfaqnyadisini");
                },
                child: Text(
                  question,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/isidetailfaqnyadisini");
              },
              child: Icon(Icons.navigate_next, color: Colors.black), // Icon "> "
            ),
          ],
        ),
      ),
    );
  }
}
