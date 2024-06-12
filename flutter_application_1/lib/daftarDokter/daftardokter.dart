import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/daftarDokter/DoctorDetailPage.dart';
import 'package:tubes_5_wavecare/faq/FAQ.dart';
import 'package:tubes_5_wavecare/homepage.dart';
import 'package:tubes_5_wavecare/kartu.dart';
import 'package:tubes_5_wavecare/pembayaran/pembayaran.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(DaftarDokterApp());
}

class DoctorService {
  static const String baseUrl = 'http://127.0.0.1:8001/dokter'; // Update this based on your testing environment

  Future<Map<String, dynamic>> addDoctor(Map<String, dynamic> doctorData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/addDoctor'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(doctorData),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to add doctor');
    }
  }

  Future<Map<String, dynamic>> getDoctor(int idDoctor) async {
    final response = await http.get(
      Uri.parse('$baseUrl/getDoctor/$idDoctor'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load doctor');
    }
  }

  Future<List<Map<String, dynamic>>> getAllDoctors() async {
    final response = await http.get(
      Uri.parse('$baseUrl/getAllDoctors'),
    );

    if (response.statusCode == 200) {
      List<dynamic> doctors = json.decode(response.body);
      return doctors.map((doctor) => doctor as Map<String, dynamic>).toList();
    } else {
      print('Error: ${response.statusCode} ${response.reasonPhrase}');
      throw Exception('Failed to load doctors');
    }
  }

  Future<Map<String, dynamic>> updateDoctor(int idDoctor, Map<String, dynamic> doctorData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/updateDoctor/$idDoctor'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(doctorData),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update doctor');
    }
  }

  Future<void> deleteDoctor(int idDoctor) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/deleteDoctor/$idDoctor'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete doctor');
    }
  }

  Future<Map<String, dynamic>> getDoctorDetails(int idDoctor) async {
    final response = await http.get(
      Uri.parse('$baseUrl/getDoctorDetails/$idDoctor'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load doctor details');
    }
  }
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
  List<Map<String, dynamic>> doctors = [];
  List<String> spesialisFilter = [];
  String searchQuery = '';
  int _selectedIndex = 1; // Indeks item yang sedang dipilih

  final DoctorService _doctorService = DoctorService();

  @override
  void initState() {
    super.initState();
    fetchDoctors();
  }

  Future<void> fetchDoctors() async {
    try {
      final result = await _doctorService.getAllDoctors();
      setState(() {
        doctors = result;
      });
    } catch (e) {
      print('Failed to fetch doctors: $e');
    }
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
    _onItemTapped(2);
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
                final List<String> allSpecialists = doctors
                    .map((doctor) => doctor['doctor_poli'] as String)
                    .toSet()
                    .toList();
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: allSpecialists.map((spesialis) {
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
    List<Map<String, dynamic>> filteredDoctors = doctors.where((doctor) {
      final nameMatch = doctor['doctor_name']
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
      final specialistMatch = spesialisFilter.isEmpty ||
          spesialisFilter.contains(doctor['doctor_poli']);
      return nameMatch && specialistMatch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Daftar Dokter',
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.transparent,
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
              child: ListView.builder(
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = filteredDoctors[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DokterCard(
                      idDoctor: doctor['id_doctor'],
                      namaDokter: doctor['doctor_name'],
                      spesialis: doctor['doctor_poli'],
                      rating: 4.5,
                    ),
                  );
                },
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
}

class DokterCard extends StatelessWidget {
  final int idDoctor;
  final String namaDokter;
  final String spesialis;
  final double rating;

  DokterCard({
    required this.idDoctor,
    required this.namaDokter,
    required this.spesialis,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Navigating to DetailDokterPage with idDoctor: $idDoctor'); // Debug print
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailDokterPage(idDoctor: idDoctor),
          ),
        );
      },
      child: Card(
        color: Colors.lightBlue[100],
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
