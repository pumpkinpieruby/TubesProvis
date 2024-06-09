import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tubes_5_wavecare/pembayaran/pembayaran.dart';

void main() {
  runApp(detailBPJS());
}

class detailBPJS extends StatefulWidget {
  @override
  _detailBPJSState createState() => _detailBPJSState();
}

class _detailBPJSState extends State<detailBPJS> {
  Map<String, dynamic>? bpjsDetail;
  String token = ''; // Simpan token setelah login
  int userId = 1; // Asumsikan kita memiliki user ID setelah login

  @override
  void initState() {
    super.initState();
    fetchBPJSDetail();
  }

  Future<void> fetchBPJSDetail() async {
    final url =
        Uri.parse('http://127.0.0.1:8001/pendaftaran/getBPJSDetail/$userId');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        bpjsDetail = json.decode(response.body);
      });
    } else {
      print('Failed to fetch BPJS detail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: bpjsDetail != null
          ? BPJS(bpjsDetail: bpjsDetail!)
          : Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}

class BPJS extends StatelessWidget {
  final Map<String, dynamic> bpjsDetail;

  BPJS({required this.bpjsDetail});

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
              MaterialPageRoute(builder: (context) => pembayaran()),
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
            SizedBox(height: 20),
            BillInformation(bpjsDetail: bpjsDetail),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class BillInformation extends StatelessWidget {
  final Map<String, dynamic> bpjsDetail;

  BillInformation({required this.bpjsDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ANDA MERUPAKAN PASIEN BPJS AKTIF, SEGALA TAGIHAN TELAH DITANGGUNG',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'Nomor BPJS : ${bpjsDetail['bpjs_number']}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Nama Pasien : ${bpjsDetail['nama_pasien']}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Nomor Rekam Medis : ${bpjsDetail['nomor_rekam_medis']}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Tempat/Tanggal Lahir : ${bpjsDetail['tanggal_lahir']}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Tanggal Pembayaran : ${bpjsDetail['tanggal_pembayaran']}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'Tagihan',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Divider(color: Colors.black),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Tagihan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rp.0,-',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/bpjs.png',
                height: 20,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
