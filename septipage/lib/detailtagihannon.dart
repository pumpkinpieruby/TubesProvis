import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TagihanNon(),
    );
  }
}

class TagihanNon extends StatelessWidget {
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
                ],
              ),
            ),
            SizedBox(height: 30),
            _buildCategoryItem(
                'Pembayaran Melalui', Icons.payment_outlined, context),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientInfo() {
    // Simulated patient information
    String patientName = 'John Doe';
    String norekmed = '1729 - 1381- 11';
    String ttl = 'Jakarta, 01 Januari 1990';
    String paymentdate = '18 Mei 2022';
    String paymentdl = '22 Mei 2022';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      {'description': 'Pemeriksaan Radiologi', 'amount': 300000},
      {'description': 'Pemeriksaan Laboratorium', 'amount': 150000},
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

  Widget _buildCategoryItem(String title, IconData icon, BuildContext context) {
    return InkWell(
      onTap: () {
        // Action when category is clicked
        print('Kategori $title diklik');
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[100],
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                // Action when '>' button is clicked
                print('Tombol ">" untuk kategori $title diklik');
              },
              icon: Icon(Icons.navigate_next, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
