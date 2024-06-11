import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
  Map<String, List<Map<String, dynamic>>> poliContent =
      {}; // Map untuk menyimpan konten poli
  Map<String, bool> expandedPoli =
      {}; // Map untuk menyimpan status kotak poli yang terbuka
  String searchQuery = ''; // State untuk menyimpan kata kunci pencarian
  String token = ''; // Simpan token setelah login

  @override
  void initState() {
    super.initState();
    fetchDoctors(); // Panggil fungsi fetchDoctors untuk mengambil data dokter
  }

  // Fungsi untuk mengambil data dokter dari API
  Future<void> fetchDoctors() async {
    final url = Uri.parse('http://127.0.0.1:8001/dokter/getAllDoctors');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        // Proses data dokter dan simpan dalam poliContent dan expandedPoli
        data.forEach((doctor) {
          final poliName = doctor[
              'doctor_poli']; // Gantilah 'poli' dengan nama field yang sesuai dari API kamu
          if (!poliContent.containsKey(poliName)) {
            poliContent[poliName] = [];
            expandedPoli[poliName] = false;
          }
          poliContent[poliName]!.add(doctor);
        });
      });
    } else {
      print('Failed to fetch doctors');
    }
  }

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
              MaterialPageRoute(
                  builder: (context) =>
                      pendaftaran()), // Ganti dengan halaman homepage
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
                  updateSearchQuery(
                      value); // Memperbarui pencarian saat teks berubah
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
            SizedBox(
                height: 16.0), // Spasi antara search bar dan kotak-kotak poli

            // ListView untuk menampilkan kotak-kotak poli berdasarkan hasil pencarian
            Expanded(
              child: ListView.builder(
                itemCount: poliContent.length,
                itemBuilder: (context, index) {
                  String poliName = poliContent.keys.elementAt(index);
                  List<Map<String, dynamic>> content =
                      poliContent[poliName] ?? [];

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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    poliName,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    expandedPoli[poliName] ?? false
                                        ? Icons.expand_less
                                        : Icons.expand_more,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Menampilkan kotak-kotak di bawah jika kotak poli terbuka
                          if (expandedPoli[poliName]!)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: content.map((doctor) {
                                return _buildSubBoxes(
                                  doctor, // Gantilah 'name' dengan nama field yang sesuai dari API kamu
                                  poliName,
                                  MediaQuery.of(context).size.width,
                                );
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
  Widget _buildSubBoxes(doctor, String poliName, double width) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman pendaftaran ketika kotak dokter di-klik
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Pendaftaran2(
              doctorId: doctor['id_doctor'],
              doctorName: doctor['doctor_name'],
            ),
          ),
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
                  doctor['doctor_name'],
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
