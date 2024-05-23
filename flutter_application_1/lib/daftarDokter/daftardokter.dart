import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/daftarDokter/DoctorDetailPage.dart';
import 'package:tubes_5_wavecare/faq/FAQ.dart';
import 'package:tubes_5_wavecare/homepage.dart';
import 'package:tubes_5_wavecare/kartu.dart';
import 'package:tubes_5_wavecare/pembayaran/pembayaran.dart';

void main() {
  runApp(DaftarDokterApp());
}

class DaftarDokterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DaftarDokterPage(),
    );
  }
}

class DaftarDokterPage extends StatefulWidget {
  @override
  _DaftarDokterPageState createState() => _DaftarDokterPageState();
}

class _DaftarDokterPageState extends State<DaftarDokterPage> {
  final Map<String, List<String>> daftarDokter = {
    'Spesialis Umum': ['Dian Ismaya', 'Dino Halim', 'Landry Miguna'],
    'Spesialis Saraf': ['Ada Wong', 'Ahmad Ibrahim'],
    'Spesialis Anak': ['Natasha', 'Bai Lu'],
    'Spesialis THT': ['Amanda Tan', 'Caroline Wong'],
    'Spesialis Penyakit Dalam': ['Farah Rahman', 'Linda Patel'],
    'Spesialis Mata': ['Michael Nguyen', 'Tina Chen'],
    'Spesialis Gigi': ['Xander Liu', 'Bella Wang', 'Yuki Tanaka'],
    'Spesialis Jantung': ['Leon Kenedy', 'Cocolia'],
    'Spesialis Kulit': ['Priya Sharma', 'Valerie Johnson'],
    'Spesialis Tulang': ['Ayumi Nishimura'],
    'Spesialis Bedah': ['Aiko Tanaka', 'Daichi Suzuki', 'Renjiro Sato', 'Yukihiro Mori'],
    'Spesialis Kandungan': ['Kenjiro Ono', 'Mai Nakamura'],
    'Spesialis Psikiatri': ['Noboru Yamaguchi', 'Riko Saito', 'Kai Ito']
  };

  List<String> spesialisFilter = [];
  String searchQuery = '';
  int _selectedIndex = 1; // Indeks item yang sedang dipilih

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
        // Tidak perlu navigasi ke halaman saat indeks 1 karena sudah berada di DaftarDokterPage
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

  void _onCreditCardPressed() {
    _onItemTapped(2); // Navigasi ke halaman kartu saat floating action button ditekan
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Filter Spesialis'),
          content: SingleChildScrollView(
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: daftarDokter.keys.map((spesialis) {
                    bool isChecked = spesialisFilter.contains(spesialis);
                    return CheckboxListTile(
                      title: Text(spesialis),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          if (value!) {
                            spesialisFilter.add(spesialis);
                          } else {
                            spesialisFilter.remove(spesialis);
                          }
                        });
                      },
                    );
                  }).toList(),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {});
              },
              child: Text('Terapkan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Daftar Dokter',
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.transparent, // Atur background AppBar menjadi transparan
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari dokter',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: _showFilterDialog,
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView(
                children: daftarDokter.entries
                    .where((entry) =>
                        spesialisFilter.isEmpty || spesialisFilter.contains(entry.key))
                    .map((entry) {
                  String spesialis = entry.key;
                  List<String> daftarDokterSpesialis = entry.value
                      .where((dokter) => dokter.toLowerCase().contains(searchQuery.toLowerCase()))
                      .toList();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          spesialis,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ...daftarDokterSpesialis.map((dokter) {
                        String gelar = _getGelarDokter(spesialis);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DokterCard(
                            namaDokter: 'Dr. $dokter, $gelar',
                            spesialis: spesialis,
                            rating: 4.5,
                            nomorStr: '',
                            riwayatPendidikan: [],
                            riwayatPraktik: [],
                          ),
                        );
                      }).toList(),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
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

  String _getGelarDokter(String spesialis) {
    switch (spesialis) {
      case 'Spesialis Umum':
        return '';
      case 'Spesialis Saraf':
        return 'Sp.S';
      case 'Spesialis Anak':
        return 'Sp.A';
      case 'Spesialis THT':
        return 'Sp.THT';
      case 'Spesialis Penyakit Dalam':
        return 'Sp.PD';
      case 'Spesialis Mata':
        return 'Sp.M';
      case 'Spesialis Gigi':
        return 'Drg.';
      case 'Spesialis Jantung':
        return 'Sp.JP';
      case 'Spesialis Kulit':
        return 'Sp.KK';
      case 'Spesialis Tulang':
        return 'Sp.OT';
      case 'Spesialis Bedah':
        return 'Sp.B';
      case 'Spesialis Kandungan':
        return 'Sp.OG';
      case 'Spesialis Psikiatri':
        return 'Sp.KJ';
      default:
        return '';
    }
  }
}

class DokterCard extends StatelessWidget {
  final String namaDokter;
  final String spesialis;
  final double rating;
  final String nomorStr;
  final List<String> riwayatPendidikan;
  final List<String> riwayatPraktik;

  DokterCard({
    required this.namaDokter,
    required this.spesialis,
    required this.rating,
    required this.nomorStr,
    required this.riwayatPendidikan,
    required this.riwayatPraktik,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman detail dokter
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailDokterPage(
              namaDokter: namaDokter,
              spesialis: spesialis,
              rating: rating,
              nomorStr: nomorStr,
              riwayatPendidikan: riwayatPendidikan,
              riwayatPraktik: riwayatPraktik,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.lightBlue[100], // Atur warna latar belakang Card
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      namaDokter,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      spesialis,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.0),
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: Icon(
                  Icons.person,
                  size: 36.0,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
