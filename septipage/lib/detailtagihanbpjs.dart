import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TagihanBPJS(),
    );
  }
}

class TagihanBPJS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(228, 255, 255, 255),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Profile()), // Ganti dengan halaman homepage
            );
          },
        ),
        title: Text(
          'Detail Tagihan',
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
            Center(
              child: Text(
                'ANDA MERUPAKAN PASIEN BPJS AKTIF,\nSEGALA TAGIHAN TELAH DITANGGUNG',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue[
                    100], // Background color for Info and Bill details
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
                    'Detail Tagihan',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildBillDetails(), // Bill details
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/bpjs.png', // Path gambar dari asset
                    width: 250,
                    height: 40,
                    fit: BoxFit.fill,
                  ),
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
    String bpjs = '987654321';
    String patientName = 'John Doe';
    String norekmed = '1729 - 1381- 11';
    String ttl = 'Jakarta, 01 Januari 1990';
    String paymentdate = '18 Mei 2022';
    String paymentdl = '22 Mei 2022';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nomor BPJS: $bpjs',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 5),
        Text(
          'Nama: $patientName',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 5),
        Text(
          'Nomor Rekam Medis: $norekmed',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 5),
        Text(
          'Tempat/Tanggal Lahir: $ttl',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 5),
        Text(
          'Tanggal Pembayaran: $paymentdate',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 5),
        Text(
          'Tenggat Pembayaran: $paymentdl',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildBillDetails() {
    // Simulated bill details
    List<Map<String, dynamic>> billDetails = [
      {'description': 'Pemeriksaan Radiologi', 'amount': 0},
      {'description': 'Pemeriksaan Laboratorium', 'amount': 0},
    ];

    int totalBill =
        billDetails.fold<int>(0, (sum, item) => sum + (item['amount'] as int));

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
                  bill['description'],
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '\Rp. ${bill['amount']}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        }).toList(),
        Divider(thickness: 1, height: 30, color: Colors.grey),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Tagihan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '\Rp. $totalBill',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
