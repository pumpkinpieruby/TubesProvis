import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tubes_5_wavecare/pembayaran/pembayaran.dart';
import 'package:tubes_5_wavecare/pembayaran/pilihanpembayaran.dart';

void main() {
  runApp(detailTagihan(idPendaftaran: 1)); // ID pendaftaran contoh
}

class detailTagihan extends StatefulWidget {
  final int idPendaftaran;

  detailTagihan({required this.idPendaftaran});

  @override
  _detailTagihanState createState() => _detailTagihanState();
}

class _detailTagihanState extends State<detailTagihan> {
  Map<String, dynamic>? billDetail;
  String token = ''; // Simpan token setelah login

  @override
  void initState() {
    super.initState();
    fetchBillDetail(widget.idPendaftaran); // Ambil detail tagihan
  }

  Future<void> fetchBillDetail(int idPendaftaran) async {
    final url = Uri.parse(
        'http://127.0.0.1:8001/pendaftaran/getBillDetail/$idPendaftaran');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        billDetail = json.decode(response.body);
      });
    } else {
      print('Failed to fetch bill detail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          child: billDetail == null
              ? Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(),
                    SizedBox(height: 20),
                    BillInformation(billDetail: billDetail!),
                    SizedBox(height: 60),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          print('Tombol "Pembayaran melalui" diklik');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pilihanPembayaran()),
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.payments_rounded),
                                SizedBox(
                                    width: 8), // Jarak antara ikon dan teks
                                Text(
                                  'Pembayaran melalui',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
        ),
      ),
    );
  }
}

class BillInformation extends StatelessWidget {
  final Map<String, dynamic> billDetail;

  BillInformation({required this.billDetail});

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
            'Nama Pasien: ${billDetail['nama_pasien']}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Nomor Rekam Medis: ${billDetail['nomor_rekam_medis']}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Tempat/Tanggal Lahir: ${billDetail['tanggal_lahir']}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Tanggal Pembayaran: ${billDetail['tanggal_pembayaran']}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Tenggat Pembayaran: ${billDetail['tenggat_pembayaran']}',
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
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Biaya Dokter',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Rp.${billDetail['tagihan'].toStringAsFixed(2)},-',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pajak (10%)',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Rp.${(billDetail['tagihan'] * 0.1).toStringAsFixed(2)},-',
                style: TextStyle(fontSize: 16),
              ),
            ],
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
                'Rp.${billDetail['total_tagihan'].toStringAsFixed(2)},-',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
