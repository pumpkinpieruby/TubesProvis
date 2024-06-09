import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tubes_5_wavecare/login-daftar/login.dart';
<<<<<<< HEAD
=======
//  import 'package:tubes_5_wavecare/setpassword.dart';
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9

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
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _bpjsController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
<<<<<<< HEAD
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> _submitData() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Password dan konfirmasi password tidak cocok.')),
      );
      return;
    }

    final url = Uri.parse('http://127.0.0.1:8001/user/register/');
=======

  Future<void> _submitData() async {
    final url = Uri.parse('http://127.0.0.1:8000/user/register/');
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'user_nama': _fullNameController.text,
        'user_email': _emailController.text,
        'user_no_telp': _phoneController.text,
        'user_password': _passwordController.text,
        'user_nik': _nikController.text,
        'user_tanggal_lahir': _birthDateController.text,
        'user_bpjs': _bpjsController.text,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print(responseData);
      // Navigate to the next screen
      Navigator.push(
        context,
<<<<<<< HEAD
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      print('Failed to create user');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to register. Please try again.')),
      );
=======
        MaterialPageRoute(builder: (context) => Login()),
      );
    } else {
      print('Failed to create user');
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
    }
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
                  controller: _fullNameController,
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
                  controller: _birthDateController,
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
                  controller: _phoneController,
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
<<<<<<< HEAD
                  controller: _bpjsController,
=======
                   controller: _bpjsController,
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
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
              SizedBox(height: 10),
              Text(
                'Kata Sandi',
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
                  controller: _passwordController,
                  obscureText: true, // Menyembunyikan input
                  decoration: InputDecoration(
                    hintText: 'Masukkan Kata Sandi',
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
                'Konfirmasi Kata Sandi',
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
<<<<<<< HEAD
                  controller: _confirmPasswordController,
=======
                  controller: _passwordController,
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
                  obscureText: true, // Menyembunyikan input
                  decoration: InputDecoration(
                    hintText: 'Masukkan Kembali Kata Sandi',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(133, 133, 133, 100),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
<<<<<<< HEAD
              SizedBox(height: 32),
=======
                SizedBox(height: 32),
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
              Center(
                child: ElevatedButton(
                  onPressed: _submitData,
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
                        'Buat Akun',
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
