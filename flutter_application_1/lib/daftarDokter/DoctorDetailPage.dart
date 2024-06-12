import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class DoctorService {
  static const String baseUrl = 'http://yourapiurl.com';

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

class DetailDokterPage extends StatelessWidget {
  final int idDoctor;

  DetailDokterPage({required this.idDoctor});

  final DoctorService _doctorService = DoctorService();

  Future<Map<String, dynamic>> fetchDoctorDetails() async {
    return await _doctorService.getDoctorDetails(idDoctor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Detail Dokter')),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchDoctorDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data'));
          }

          final doctor = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Icon(
                      Icons.person,
                      size: 80.0,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: Text(
                      doctor['doctor_name'] ?? '',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Center(
                    child: Text(
                      doctor['doctor_specialist'] ?? '',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nomor STR',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          doctor['doctor_STR'] ?? '',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Riwayat Pendidikan',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '- S1: ${doctor['riwayat_pendidikan']['S1'] ?? ''}',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '- S2: ${doctor['riwayat_pendidikan']['S2'] ?? ''}',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '- S3: ${doctor['riwayat_pendidikan']['S3'] ?? ''}',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Riwayat Praktik',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '- Tempat1: ${doctor['riwayat_praktik']['Tempat1'] ?? ''}',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '- Tempat2: ${doctor['riwayat_praktik']['Tempat2'] ?? ''}',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '- Tempat3: ${doctor['riwayat_praktik']['Tempat3'] ?? ''}',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jadwal Praktik',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '- Hari: ${doctor['jadwal']['hari'] ?? ''}',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '- Jam Masuk: ${doctor['jadwal']['jam_masuk'] ?? ''}',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '- Jam Selesai: ${doctor['jadwal']['jam_selesai'] ?? ''}',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
class JadwalPraktikPage extends StatelessWidget {
  final String hari;

  JadwalPraktikPage({required this.hari});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Praktik'),
      ),
      body: Center(
        child: Text('Jadwal Praktik untuk Hari $hari'),
      ),
    );
  }
}
