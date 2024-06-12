import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:tubes_5_wavecare/pendaftaran/detailPendaftaran.dart';
import 'package:tubes_5_wavecare/pendaftaran/ketersediaandokter.dart';

void main() {
  runApp(Pendaftaran2(doctorId: 1, doctorName: 'Dr. Sofi'));
}

class Pendaftaran2 extends StatelessWidget {
  final int doctorId;
  final String doctorName;

  Pendaftaran2({required this.doctorId, required this.doctorName});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HealthInfoPage(doctorId: doctorId, doctorName: doctorName),
    );
  }
}

class HealthInfoPage extends StatefulWidget {
  final int doctorId;
  final String doctorName;

  HealthInfoPage({required this.doctorId, required this.doctorName});

  @override
  _HealthInfoPageState createState() => _HealthInfoPageState();
}

class _HealthInfoPageState extends State<HealthInfoPage> {
  List<Map<String, dynamic>> schedules = [];
  String? selectedTime;
  DateTime? selectedDate;
  String token = ''; // Simpan token setelah login
  int userId = 1; // Asumsikan kita memiliki user ID setelah login

  @override
  void initState() {
    super.initState();
    fetchDoctorSchedules(widget
        .doctorId); // Panggil fungsi fetchDoctorSchedules untuk mengambil data jadwal dokter
  }

  Future<void> fetchDoctorSchedules(int doctorId) async {
    final url = Uri.parse(
        'http://127.0.0.1:8001/jadwal_dokter/getJadwalByDoctor/$doctorId');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      setState(() {
        schedules = data.map((item) {
          return {
            'time': '${item['jam_masuk']}-${item['jam_selesai']}',
            'day': item['hari']
          };
        }).toList();
      });
    } else {
      print('Failed to fetch doctor schedules');
    }
  }

  void _registerForAppointment() async {
    if (selectedDate != null && selectedTime != null) {
      final selectedSchedule =
          schedules.firstWhere((schedule) => schedule['time'] == selectedTime);
      final url = Uri.parse('http://127.0.0.1:8001/pendaftaran/addPendaftaran');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'user_id': userId,
          'dokter_id': widget.doctorId,
          'tanggal': DateFormat('yyyy-MM-dd').format(selectedDate!),
          'jam': selectedTime,
          'hari': selectedSchedule['day'],
        }),
      );

      if (response.statusCode == 201) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Pendaftaran3(
                    idPendaftaran: 2,
                  )),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to register for appointment')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a date and time')),
      );
    }
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
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
              MaterialPageRoute(builder: (context) => ketersediaandokter()),
            );
          },
        ),
        title: Text(
          'Pendaftaran - ${widget.doctorName}',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                selectedDate == null
                    ? 'Pilih Tanggal'
                    : DateFormat('yyyy-MM-dd').format(selectedDate!),
              ),
              trailing: Icon(Icons.calendar_today),
              onTap: () => _selectDate(context),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: schedules.length,
                itemBuilder: (context, index) {
                  String time = schedules[index]['time'];

                  return RadioListTile<String>(
                    title: Text(time),
                    value: time,
                    groupValue: selectedTime,
                    onChanged: (value) {
                      setState(() {
                        selectedTime = value;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: ElevatedButton(
            onPressed: _registerForAppointment,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            child: Text(
              'Lanjutkan',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
