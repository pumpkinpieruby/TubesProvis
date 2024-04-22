import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(notif());
}

class notif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Notifikasi(),
    );
  }
}

class Notifikasi extends StatefulWidget {
  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  List<Widget> notifikasiList = [
    NotifikasiContainer(
      judul: 'Notifikasi 1',
      isi: 'Isi notifikasi 1',
    ),
    NotifikasiContainer(
      judul: 'Notifikasi 2',
      isi: 'Isi notifikasi 2',
    ),
    NotifikasiContainer(
      judul: 'Notifikasi 3',
      isi: 'Isi notifikasi 3',
    ),
    NotifikasiContainer(
      judul: 'Notifikasi 4',
      isi: 'Isi notifikasi 4',
    ),
    NotifikasiContainer(
      judul: 'Notifikasi 5',
      isi: 'Isi notifikasi 5',
    ),
  ];

  void hapusNotifikasi() {
    setState(() {
      notifikasiList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(228, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(228, 255, 255, 255),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => homepage()),
          );
        },
        ),
        title: Text(
          'Notifikasi',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00A9FF),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0), // Padding untuk halaman
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Set the button background color to transparent
                    elevation: 0, // Remove button shadow
                  ),
                  onPressed: hapusNotifikasi,
                  icon: Icon(Icons.delete, color: Colors.black), // Set icon color to black
                  label: Text('Hapus Semua Notifikasi', style: TextStyle(color: Colors.black)), // Set text color to black
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView(
                  children: notifikasiList,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotifikasiContainer extends StatelessWidget {
  final String judul;
  final String isi;

  NotifikasiContainer({required this.judul, required this.isi});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Color(0xFF00A9FF),
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              judul,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              isi,
            ),
          ],
        ),
      ),
    );
  }
}