import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/Profile.dart';

void main() {
  runApp(keluarga());
}

class keluarga extends StatelessWidget {
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
  TextEditingController _alamatController = TextEditingController();

  // Variabel untuk validasi
  bool _validateNama = false;
  bool _validateHubungan = false;
  bool _validateTelepon = false;
  bool _validateAlamat = false;

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
          'Keluarga',
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(160, 233, 255, 30),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Text(
                      'Daftar Keluarga Pasien:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        Text(
                          'Gepard',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'ANAK PASIEN',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '081261927199',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Jl. Indah Jaya No.18 Bandung',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    // Menampilkan daftar keluarga pasien
                    // Sesuaikan dengan data yang dimiliki
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showForm = true; // Menampilkan formulir ketika tombol ditekan
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(160, 233, 255, 30),
                ),
                child: Text(
                  'Tambah Keluarga',
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
                          labelText: 'Nama',
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
                          labelText: 'Hubungan Keluarga',
                          errorText: _validateHubungan
                              ? 'Hubungan keluarga harus diisi'
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
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _alamatController,
                        decoration: InputDecoration(
                          labelText: 'Alamat',
                          errorText:
                              _validateAlamat ? 'Alamat harus diisi' : null,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _validateAlamat = value.isEmpty;
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
                            _validateTelepon =
                                _teleponController.text.isEmpty;
                            _validateAlamat = _alamatController.text.isEmpty;
                          });

                          // Jika tidak ada pesan error, tampilkan popup "Data berhasil ditambahkan"
                          if (!_validateNama &&
                              !_validateHubungan &&
                              !_validateTelepon &&
                              !_validateAlamat) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Sukses"),
                                  content:
                                      Text("Data berhasil ditambahkan."),
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
                          backgroundColor:
                              Color.fromRGBO(160, 233, 255, 30),
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
        ),
      ),
    );
  }
}
