import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResepObat1(),
    );
  }
}

class ResepObat1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(228, 255, 255, 255),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: Text(
          'Resep Obat',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00A9FF),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue[100], // Background color for Info and Bill details
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black, width: 1),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informasi Pasien',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildPatientInfo(), // Patient information
                  SizedBox(height: 30),
                  Text(
                    'Resep Obat',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center, // Align text to the center
                  ),
                  SizedBox(height: 10),
                  _buildBillDetails(), // Bill details
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientInfo() {
    // Simulated patient information
    String patientName = 'John Doe';
    String doctor = 'Clara';
    String idRekamMedis = '12345456';
    String tanggal = '12 Oktober 2020';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama: $patientName',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 5),
        Text(
          'Dokter: $doctor',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 5),
        Text(
          'No. Rekam Medis: $idRekamMedis',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 5),
        Text(
          'Tanggal Pemeriksaan: $tanggal',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildBillDetails() {
    // Simulated bill details
    List<Map<String, dynamic>> billDetails = [
      {'number': 1, 'description': 'Omeprazole'},
      {'number': 2, 'description': 'Kamaflam'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...billDetails.map((bill) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${bill['number']}. ${bill['description']}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
