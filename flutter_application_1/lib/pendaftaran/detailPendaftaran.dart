import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tubes_5_wavecare/pembayaran/detailTagihan.dart';

void main() {
  runApp(Pendaftaran3(idPendaftaran: 1)); // ID pendaftaran contoh
}

class Pendaftaran3 extends StatefulWidget {
  final int idPendaftaran;

  Pendaftaran3({required this.idPendaftaran});

  @override
  _Pendaftaran3State createState() => _Pendaftaran3State();
}

class _Pendaftaran3State extends State<Pendaftaran3> {
  Map<String, dynamic>? pendaftaranDetail;
  String token = 'YOUR_TOKEN_HERE'; // Gantilah dengan token yang benar

  @override
  void initState() {
    super.initState();
    fetchPendaftaranDetail(widget.idPendaftaran); // Ambil detail pendaftaran
  }

  Future<void> fetchPendaftaranDetail(int idPendaftaran) async {
    final url = Uri.parse(
        'http://127.0.0.1:8001/pendaftaran/getPendaftaran/$idPendaftaran');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        pendaftaranDetail = json.decode(response.body);
        print('Detail fetched: $pendaftaranDetail');
      });
    } else {
      print('Failed to fetch registration detail. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detail Pendaftaran',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: Text(
              'Detail Pendaftaran',
              style: TextStyle(
                color: Colors.blue, // Warna biru
                fontSize: 20,
              ),
            ),
          ),
          backgroundColor: Colors.transparent, // Background transparan
          elevation: 0, // Menghapus shadow di bawah app bar
        ),
        body: pendaftaranDetail == null
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors
                            .blue[100], // Warna biru muda untuk kontainer list
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('Nama Pasien'),
                            trailing: Text(pendaftaranDetail!['nama_pasien'] ?? 'Unknown'),
                          ),
                          ListTile(
                            title: Text('Nomor Pendaftaran'),
                            trailing: Text(pendaftaranDetail!['id_pendaftaran']
                                .toString()),
                          ),
                          ListTile(
                            title: Text('Tanggal Pemeriksaan'),
                            trailing: Text(pendaftaranDetail!['tanggal'] ?? 'Unknown'),
                          ),
                          ListTile(
                            title: Text('Jam Pemeriksaan'),
                            trailing: Text(pendaftaranDetail!['jam'] ?? 'Unknown'),
                          ),
                          ListTile(
                            title: Text('Poli'),
                            trailing: Text(pendaftaranDetail!['poli'] ?? 'Unknown'),
                          ),
                          ListTile(
                            title: Text('Dokter'),
                            trailing: Text(pendaftaranDetail!['nama_dokter'] ?? 'Unknown'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => detailTagihan(idPendaftaran: widget.idPendaftaran)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[100], // Warna biru muda
                        ),
                        child: Text(
                          'Lanjutkan Pembayaran',
                          style: TextStyle(color: Colors.black), // Teks hitam
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
