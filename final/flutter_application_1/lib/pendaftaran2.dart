import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/ketersediaandokter.dart';
import 'package:tubes_5_wavecare/riwayatpendaftaran%20copy.dart';

void main() {
  runApp(Pendaftaran2());
}

class Pendaftaran2 extends StatelessWidget {
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
  List<Map<String, List<String>>> poliContent = [
    {
      'Dr. Dian Ismaya': ['Senin', 'Rabu'],
    },
  ];

  String? selectedDay;

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
          'Pendaftaran',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: poliContent.length,
        itemBuilder: (context, index) {
          String poliName = poliContent[index].keys.first;
          List<String> content = poliContent[index][poliName] ?? [];

          return ExpansionTile(
            title: Text(
              poliName,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            children: content.map((item) {
              return RadioListTile<String>(
                title: Text(item),
                value: item,
                groupValue: selectedDay,
                onChanged: (value) {
                  setState(() {
                    selectedDay = value;
                  });
                },
              );
            }).toList(),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: ElevatedButton(
            onPressed: () {
              if (selectedDay != null) {
                // Lakukan aksi lanjutan di sini (misalnya, navigasi ke halaman beranda)
                Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => riwayatpendaftaran()), // Ganti dengan halaman Homepage yang benar
        );
              } else {
                // Tampilkan pesan kesalahan jika tidak ada hari yang dipilih
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Pilih salah satu hari terlebih dahulu.'),
                  ),
                );
              }
            },
            child: Text(
              'Lanjutkan',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}
