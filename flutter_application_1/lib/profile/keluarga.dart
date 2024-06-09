import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/profile/Profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  _KeluargaState createState() => _KeluargaState();
}

class _KeluargaState extends State<KeluargaPage> {
  final TextEditingController _contactNameController = TextEditingController();
  final TextEditingController _contactDescController = TextEditingController();
  final TextEditingController _contactPhoneController = TextEditingController();

  final List<Map<String, String>> _kontakList = [];
  bool _showForm = false;
  bool _validateNama = false;
  bool _validateHubungan = false;
  bool _validateTelepon = false;

  Future<void> _submitData() async {
<<<<<<< HEAD
    final url = Uri.parse('http://127.0.0.1:8001/contacts/addUrgentContact');
=======
    final url = Uri.parse('http://127.0.0.1:8000/contacts/addUrgentContact');
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9

    final data = {
      'urgent_contact_name': _contactNameController.text,
      'urgent_contact_desc': _contactDescController.text,
      'urgent_contact_notelp': _contactPhoneController.text,
    };

    print('Sending data: $data'); // Debugging

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print(responseData);

      setState(() {
        _kontakList.add(data);
        _contactNameController.clear();
        _contactDescController.clear();
        _contactPhoneController.clear();
        _showForm = false;
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Sukses"),
            content: Text("Kontak darurat berhasil ditambahkan."),
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
    } else {
      print('Failed to create user: ${response.body}');
    }
  }

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
                            DataCell(Text(kontak['urgent_contact_name']!)),
                            DataCell(Text(kontak['urgent_contact_desc']!)),
                            DataCell(Text(kontak['urgent_contact_notelp']!)),
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
                  _showForm = true;
                });
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Peringatan"),
                      content: Text(
                          "Anda hanya dapat menambahkan maksimal 4 kontak darurat."),
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
                    controller: _contactNameController,
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
                    controller: _contactDescController,
                    decoration: InputDecoration(
                      labelText: 'Keterangan',
<<<<<<< HEAD
                      errorText:
                          _validateHubungan ? 'Keterangan harus diisi' : null,
=======
                      errorText: _validateHubungan ? 'Keterangan harus diisi' : null,
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
                    ),
                    onChanged: (value) {
                      setState(() {
                        _validateHubungan = value.isEmpty;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _contactPhoneController,
                    decoration: InputDecoration(
                      labelText: 'Nomor Telepon',
<<<<<<< HEAD
                      errorText:
                          _validateTelepon ? 'Nomor telepon harus diisi' : null,
=======
                      errorText: _validateTelepon ? 'Nomor telepon harus diisi' : null,
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
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
                        _validateNama = _contactNameController.text.isEmpty;
                        _validateHubungan = _contactDescController.text.isEmpty;
                        _validateTelepon = _contactPhoneController.text.isEmpty;
                      });

<<<<<<< HEAD
                      if (!_validateNama &&
                          !_validateHubungan &&
                          !_validateTelepon) {
=======
                      if (!_validateNama && !_validateHubungan && !_validateTelepon) {
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
                        _submitData();
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
