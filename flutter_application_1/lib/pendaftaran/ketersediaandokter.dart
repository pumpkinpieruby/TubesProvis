import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/pendaftaran/pendaftaran.dart';
import 'package:tubes_5_wavecare/pendaftaran/pendaftaran2.dart';

void main() {
  runApp(ketersediaandokter());
}

class ketersediaandokter extends StatelessWidget {
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
  // Map untuk menampung konten untuk setiap poli
  Map<String, List<String>> poliContent = {
    'Poli Umum': ['Dr. Dian Ismaya', 'Dr. Dino Halim', 'Dr. Landry Miguna'],
    'Poli Saraf': ['Dr. Ada Wong', 'Dr. Ahmad Ibrahim'],
    'Poli Anak': ['Dr. Natasha', 'Dr. Bai Lu'],
    'Poli THT': ['Dr. Amanda Tan', 'Dr. Caroline Wong'],
    'Poli Penyakit Dalam': ['Dr. Farah Rahman', 'Dr. Linda Patel'],
    'Poli Mata': ['Dr. Michael Nguyen', 'Dr. Tina Chen'],
    'Poli Gigi': ['Dr. Xander Liu', 'Dr. Bella Wang', 'Dr. Yuki Tanaka'],
    'Poli Jantung': ['Dr. Leon Kenedy', 'Dr. Cocolia'],
    'Poli Kulit': ['Dr. Priya Sharma', 'Dr. Valerie Johnson'],
    'Poli Tulang': ['Dr. Ayumi Nishimura'],
    'Poli Bedah': ['Dr. Aiko Tanaka', 'Dr. Daichi Suzuki', 'Dr. Renjiro Sato', 'Dr. Yukihiro Mori'],
    'Poli Kandungan': ['Dr. Kenjiro Ono', 'Dr. Mai Nakamura'],
    'Poli Psikiatri': ['Dr. Noboru Yamaguchi', 'Dr. Riko Saito', 'Dr. Kai Ito'],
  };

  // Map untuk menampung status kotak poli yang terbuka
  Map<String, bool> expandedPoli = {
    'Poli Umum': false,
    'Poli Saraf': false,
    'Poli Anak': false,
    'Poli THT': false,
    'Poli Penyakit Dalam': false,
    'Poli Mata': false,
    'Poli Gigi': false,
    'Poli Jantung': false,
    'Poli Tulang': false,
    'Poli Bedah': false,
    'Poli Kandungan': false,
    'Poli Kulit': false,
    'Poli Psikiatri': false,
  };

  String searchQuery = ''; // State untuk menyimpan kata kunci pencarian

  // Method untuk memperbarui kata kunci pencarian
  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => pendaftaran()), // Ganti dengan halaman homepage
            );
          },
        ),
        title: Text(
          'Ketersediaan Dokter',
          style: TextStyle(
            color: Colors.blue, // Warna teks biru
            fontWeight: FontWeight.bold, // Teks tebal (bold)
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                onChanged: (value) {
                  updateSearchQuery(value); // Memperbarui pencarian saat teks berubah
                },
                decoration: InputDecoration(
                  hintText: 'Cari Poli',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0), // Spasi antara search bar dan kotak-kotak poli

            // ListView untuk menampilkan kotak-kotak poli berdasarkan hasil pencarian
            Expanded(
              child: ListView.builder(
                itemCount: poliContent.length,
                itemBuilder: (context, index) {
                  String poliName = poliContent.keys.elementAt(index);
                  List<String> content = poliContent[poliName] ?? [];

                  // Filter berdasarkan kata kunci pencarian pada nama poli saja
                  if (poliName.toLowerCase().contains(searchQuery)) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          expandedPoli[poliName] = !expandedPoli[poliName]!;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Colors.blue[200], // Warna biru muda
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    poliName,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    expandedPoli[poliName] ?? false ? Icons.expand_less : Icons.expand_more,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Menampilkan kotak-kotak di bawah jika kotak poli terbuka
                          if (expandedPoli[poliName]!)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: content.map((item) {
                                return _buildSubBoxes(
                                    item, poliName, MediaQuery.of(context).size.width);
                              }).toList(),
                            ),
                        ],
                      ),
                    );
                  } else {
                    // Jika tidak ada yang cocok, kembalikan widget kosong
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method untuk membangun kotak-kotak di bawah kotak poli utama
  Widget _buildSubBoxes(String text, String poliName, double width) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke homepage ketika kotak dokter di-klik
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Pendaftaran2()), 
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(35.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
