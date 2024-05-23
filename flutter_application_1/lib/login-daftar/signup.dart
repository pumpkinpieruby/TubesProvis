import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/login-daftar/login.dart';
import 'package:tubes_5_wavecare/setpassword.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUp(),
    );
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Controllers to capture user input
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomorTeleponController = TextEditingController();
  final TextEditingController _bpjsController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _namaController.dispose();
    _tanggalLahirController.dispose();
    _nikController.dispose();
    _emailController.dispose();
    _nomorTeleponController.dispose();
    _bpjsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(228, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
        title: Text(
          'Buat Akun',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00A9FF),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30), // Menambahkan jarak dari atas
              Text(
                'Nama Lengkap',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  controller: _namaController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Nama Lengkap',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(133, 133, 133, 100),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Tanggal Lahir',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextFormField(
                  controller: _tanggalLahirController,
                  obscureText: false,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: 'HH/BB/TTTT',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(133, 133, 133, 100),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Nomor Induk Kependudukan',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  controller: _nikController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Nomor Induk Kependudukan',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(133, 133, 133, 100),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Email',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  controller: _emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Email',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(133, 133, 133, 100),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Nomor Telepon',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  controller: _nomorTeleponController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Nomor Telepon',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(133, 133, 133, 100),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Nomor BPJS',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  controller: _bpjsController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Nomor BPJS',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(133, 133, 133, 100),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Aturpassword()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00A9FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Container(
                    width: 220, // Atur lebar tombol
                    child: Center(
                      child: Text(
                        'Selanjutnya',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
