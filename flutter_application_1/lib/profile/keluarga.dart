import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/profile/Profile.dart';

void main() {
  runApp(Keluarga());
}

class Keluarga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KeluargaPage(),
    );
  }
}

class KeluargaPage extends StatefulWidget {
  @override
  _KeluargaPageState createState() => _KeluargaPageState();
}

class _KeluargaPageState extends State<KeluargaPage> {
  bool _showForm = false; // Untuk mengontrol apakah menampilkan formulir atau tidak

  // Deklarasi controller
  TextEditingController _namaController = TextEditingController();
  TextEditingController _hubunganController = TextEditingController();
  TextEditingController _teleponController = TextEditingController();

  // Variabel untuk validasi
  bool _validateNama = false;
  bool _validateHubungan = false;
  bool _validateTelepon = false;

  List<Map<String, String>> _kontakList = [
    {
      'nama': 'Gepard',
      'keterangan': 'ANAK PASIEN',
      'telepon': '081261927199',
    },
    // Tambahkan daftar kontak darurat pasien yang sudah ada di sini
  ];

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
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
        ),
        title: Text(
          'Kontak Darurat',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00A9FF),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(160, 233, 255, 30),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Daftar Kontak Darurat Pasien:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('Nama')),
                          DataColumn(label: Text('Keterangan')),
                          DataColumn(label: Text('Nomor Telepon')),
                        ],
                        rows: _kontakList.map((kontak) {
                          return DataRow(cells: [
                            DataCell(Text(kontak['nama']!)),
                            DataCell(Text(kontak['keterangan']!)),
                            DataCell(Text(kontak['telepon']!)),
                          ]);
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_kontakList.length < 4) {
                setState(() {
                  _showForm = true; // Menampilkan formulir ketika tombol ditekan
                });
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Peringatan"),
                      content: Text("Anda hanya dapat menambahkan maksimal 4 kontak darurat."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(160, 233, 255, 30),
            ),
            child: Text(
              'Tambah Kontak Darurat',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(height: 20),
          if (_showForm) ...[
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(179, 230, 255, 100),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: _namaController,
                    decoration: InputDecoration(
                      labelText: 'Nama Pasien',
                      errorText: _validateNama ? 'Nama harus diisi' : null,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _validateNama = value.isEmpty;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _hubunganController,
                    decoration: InputDecoration(
                      labelText: 'Keterangan',
                      errorText: _validateHubungan
                          ? 'Keterangan harus diisi'
                          : null,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _validateHubungan = value.isEmpty;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _teleponController,
                    decoration: InputDecoration(
                      labelText: 'Nomor Telepon',
                      errorText: _validateTelepon
                          ? 'Nomor telepon harus diisi'
                          : null,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _validateTelepon = value.isEmpty;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Validasi setiap field saat tombol simpan ditekan
                        _validateNama = _namaController.text.isEmpty;
                        _validateHubungan =
                            _hubunganController.text.isEmpty;
                        _validateTelepon = _teleponController.text.isEmpty;
                      });

                      // Jika tidak ada pesan error, tambahkan kontak ke daftar
                      if (!_validateNama &&
                          !_validateHubungan &&
                          !_validateTelepon) {
                        _kontakList.add({
                          'nama': _namaController.text,
                          'keterangan': _hubunganController.text,
                          'telepon': _teleponController.text,
                        });

                        // Tampilkan popup "Data berhasil ditambahkan"
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Sukses"),
                              content:
                                  Text("Kontak darurat berhasil ditambahkan."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );

                        // Sembunyikan formulir setelah menambahkan kontak
                        setState(() {
                          _showForm = false;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(160, 233, 255, 30),
                    ),
                    child: Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
