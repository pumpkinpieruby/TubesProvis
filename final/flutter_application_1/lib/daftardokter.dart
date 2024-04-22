import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/FAQ.dart';
import 'package:tubes_5_wavecare/homepage.dart';
import 'DoctorDetailPage.dart';
import 'kartu.dart';
import 'pembayaran.dart';
// import 'FAQ.dart';

void main() {
  runApp(daftardokter());
}

class daftardokter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: daftarDokter(),
    );
  }
}

class daftarDokter extends StatefulWidget {
  @override
  _DaftarDokterState createState() => _DaftarDokterState();
}

class _DaftarDokterState extends State<daftarDokter> {
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

  final List<Map<String, dynamic>> daftarDokter = [
    {
      "name": "Dr. John Doe",
      "specialization": "Spesialis Jantung",
      "rating": 4.5,
      "photoUrl": 'https://example.com/doctor1.jpg',
      "strNumber": "12345678910112",
      "educationHistory": [
        'Universitas Indonesia - Sarjana Kedokteran',
        'Universitas Indonesia - Magister Kedokteran'
      ],
      "practiceHistory": [
        'Rumah Sakit X - Praktik Umum',
        'Klinik Y - Spesialis Jantung',
        'RS Z - Spesialis Mata'
      ]
    },
    {
      "name": "Dr. Natasha",
      "specialization": "Spesialis Anak",
      "rating": 4.8,
      "photoUrl": 'https://example.com/doctor2.jpg',
      "strNumber": "12345678910114",
      "educationHistory": [
        'Universitas Pendidikan Indonesia - Sarjana Kedokteran',
        'Universitas Indonesia - Magister Kedokteran',
        'Universitas C - Doktor Kedokteran'
      ],
      "practiceHistory": [
        'Rumah Sakit X - Praktik Umum',
        'Klinik Y - Spesialis Jantung',
        'RS Z - Spesialis Mata'
      ]
    },
    {
      "name": "Dr. Michael Johnson",
      "specialization": "Spesialis Mata",
      "rating": 4.3,
      "photoUrl": 'https://example.com/doctor3.jpg',
      "strNumber": "12345678910115",
      "educationHistory": [
        'Universitas Indonesia - Sarjana Kedokteran',
        'Universitas Indonesia - Magister Kedokteran'
      ],
      "practiceHistory": [
        'Rumah Sakit X - Praktik Umum',
        'Klinik Y - Spesialis Jantung',
        'RS Z - Spesialis Mata'
      ]
    },
    {
      "name": "Dr. Emily Brown",
      "specialization": "Spesialis Kulit",
      "rating": 4.7,
      "photoUrl": 'https://example.com/doctor4.jpg',
      "strNumber": "12345678910116",
      "educationHistory": [
        'Universitas Padjajaran - Sarjana Kedokteran',
        'Universitas Indonesia - Magister Kedokteran',
      ],
      "practiceHistory": [
        'Rumah Sakit X - Praktik Umum',
        'Klinik Y - Spesialis Jantung',
        'RS Z - Spesialis Mata'
      ]
    },
    {
      "name": "Dr. Cocolia Rand",
      "specialization": "Spesialis Telinga",
      "rating": 4.7,
      "photoUrl": 'https://example.com/doctor4.jpg',
      "strNumber": "12345678910117",
      "educationHistory": [
        'Universitas Diponegoro - Sarjana Kedokteran',
        'Universitas Indonesia - Magister Kedokteran',
        'Universitas C - Doktor Kedokteran'
      ],
      "practiceHistory": [
        'Rumah Sakit X - Praktik Umum',
        'Klinik Y - Spesialis Jantung',
        'RS Z - Spesialis Mata'
      ]
    },
    {
      "name": "Dr. Clara",
      "specialization": "Spesialis Telinga",
      "rating": 4.8,
      "photoUrl": 'https://example.com/doctor4.jpg',
      "strNumber": "12345678910118",
      "educationHistory": [
        'Universitas Brawijaya - Sarjana Kedokteran',
        'Universitas Indonesia - Magister Kedokteran'
      ],
      "practiceHistory": [
        'Rumah Sakit X - Praktik Umum',
        'Klinik Y - Spesialis Jantung',
        'RS Z - Spesialis Mata'
      ]
    },
  ];

  String searchText = '';
  String selectedSpecialization = '';

  late List<Map<String, dynamic>>
      filteredDokter; // Deklarasi filteredDokter di sini

  @override
  Widget build(BuildContext context) {
    // Inisialisasi filteredDokter di sini
    filteredDokter = daftarDokter.where((dokter) {
      return dokter['name'].toLowerCase().contains(searchText.toLowerCase()) &&
          (selectedSpecialization.isEmpty ||
              dokter['specialization'] == selectedSpecialization);
    }).toList();

    return Scaffold(
      backgroundColor: Color.fromARGB(228, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40), // Menambahkan jarak dari atas
            Center(
              child: Text(
                'Jadwal Dokter',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00A9FF),
                ),
              ),
            ),
            SizedBox(
                height: 20), // Menambahkan jarak antara judul dan search bar
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        // Menambahkan border pada search bar
                        color: Colors.grey.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                searchText = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Cari dokter...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    width:
                        10), // Menambahkan jarak antara search bar dan logo listing
                PopupMenuButton<String>(
                  onSelected: (String newValue) {
                    setState(() {
                      selectedSpecialization = newValue;
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: '',
                      child: Text('Semua Spesialisasi'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Spesialis Jantung',
                      child: Text('Spesialis Jantung'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Spesialis Anak',
                      child: Text('Spesialis Anak'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Spesialis Mata',
                      child: Text('Spesialis Mata'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Spesialis Kulit',
                      child: Text('Spesialis Kulit'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Spesialis Telinga',
                      child: Text('Spesialis Telinga'),
                    ),
                  ],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.list,
                      size: 40,
                      color: Color(0xFF00A9FF),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                height:
                    20), // Menambahkan jarak antara search bar dan data dokter
            Expanded(
              child: ListView.builder(
                itemCount: filteredDokter.length, // Jumlah data dokter
                itemBuilder: (context, index) {
                  // Data dokter yang berbeda untuk setiap kolom
                  String name = filteredDokter[index]['name'];
                  String specialization =
                      filteredDokter[index]['specialization'];
                  double rating = filteredDokter[index]['rating'];
                  String photoUrl = filteredDokter[index]['photoUrl'];

                  // Inside ListView.builder
                  return DoctorCard(
                    name: name,
                    specialization: specialization,
                    rating: rating,
                    photoUrl: photoUrl,
                    strNumber: [], // Example strNumber data
                    educationHistory: [], // Example educationHistory data
                    practiceHistory: [], // Example practiceHistory data
                  );
                },
              ),
            ),
          ],
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
                    onPressed: () => _onItemTapped(context, 1),
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
                    onPressed: () => _onItemTapped(context, 3),
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
                    onPressed: () => _onItemTapped(context, 4),
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
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialization;
  final double rating;
  final String photoUrl;
  final List<String> strNumber;
  final List<String> educationHistory;
  final List<String> practiceHistory;

  DoctorCard({
    required this.name,
    required this.specialization,
    required this.rating,
    required this.photoUrl,
    required this.strNumber,
    required this.educationHistory,
    required this.practiceHistory,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorDetailPage(
              name: name,
              specialization: specialization,
              rating: rating,
              photoUrl: photoUrl,
              strNumber:
                  strNumber, // Gunakan strNumber langsung dari parameter konstruktor
              educationHistory:
                  educationHistory, // Gunakan educationHistory langsung dari parameter konstruktor
              practiceHistory:
                  practiceHistory, // Gunakan practiceHistory langsung dari parameter konstruktor
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 120, 217, 241),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  specialization,
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 5),
                    Text(
                      '$rating',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(photoUrl),
            ),
          ],
        ),
      ),
    );
  }
}
