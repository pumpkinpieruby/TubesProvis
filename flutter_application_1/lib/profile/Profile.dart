import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_5_wavecare/homepage.dart';
import 'package:tubes_5_wavecare/login-daftar/login.dart';
import 'package:tubes_5_wavecare/profile/keluarga.dart';
import 'package:tubes_5_wavecare/setpassword.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HealthInfoPage(),
    );
  }
}

class HealthInfoPage extends StatefulWidget {
  @override
  _HealthInfoPageState createState() => _HealthInfoPageState();
}

class _HealthInfoPageState extends State<HealthInfoPage> {
  String token = '';
  Map<String, dynamic> userProfile = {};

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController bpjsController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';

    if (token.isNotEmpty) {
      final url = Uri.parse('http://127.0.0.1:8001/user/getUserInfo');
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          userProfile = json.decode(response.body);
          nameController.text = userProfile['user_nama'] ?? '';
          phoneController.text = userProfile['user_no_telp'] ?? '';
          emailController.text = userProfile['user_email'] ?? '';
          nikController.text = userProfile['user_nik'] ?? '';
          bpjsController.text = userProfile['user_bpjs'] ?? '';
          birthDateController.text = userProfile['user_tanggal_lahir'] ?? '';
        });
      } else {
        print('Failed to fetch user profile');
      }
    } else {
      print('Token not found in SharedPreferences');
    }
  }

  Future<void> _updateProfile() async {
    print('Update profile called');
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final url = Uri.parse('http://127.0.0.1:8001/user/update_profile');
    final response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'user_nama': nameController.text,
        'user_no_telp': phoneController.text,
        'user_nik': nikController.text,
        'user_tanggal_lahir': birthDateController.text,
        'user_bpjs': bpjsController.text,
      }),
    );

    if (response.statusCode == 200) {
      print('Profile updated successfully');
      _loadUserProfile();
    } else {
      print('Failed to update profile');
    }
  }

  Future<void> _logout() async {
    final url = Uri.parse('http://127.0.0.1:8001/user/logout');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } else {
      print('Failed to logout');
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
              MaterialPageRoute(builder: (context) => homepage()),
            );
          },
        ),
        title: Text(
          'Akun',
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
        child: Column(
          children: [
            SizedBox(height: 30), // Menambahkan space tinggi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.lightBlue[100],
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                ),
                padding: EdgeInsets.all(35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    _buildDetailItem(
                      title: 'Nama Lengkap',
                      controller: nameController,
                    ),
                    SizedBox(height: 10),
                    _buildDetailItem(
                      title: 'Nomor Telepon',
                      controller: phoneController,
                    ),
                    SizedBox(height: 10),
                    _buildDetailItem(
                      title: 'Alamat Email',
                      controller: emailController,
                      enabled: false,
                    ),
                    SizedBox(height: 10),
                    _buildDetailItem(
                      title: 'NIK',
                      controller: nikController,
                    ),
                    SizedBox(height: 10),
                    _buildDetailItem(
                      title: 'Nomor BPJS',
                      controller: bpjsController,
                    ),
                    SizedBox(height: 10),
                    _buildDetailItem(
                      title: 'Tanggal Lahir',
                      controller: birthDateController,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _updateProfile,
                      child: Text('Update Profile'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), // Spasi sebelum bagian "Lainnya"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10), // Spasi sebelum "Lainnya"
                  Text(
                    'Lainnya',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10), // Spasi sebelum ikon dan teks
                  _buildOptionItem(
                    context,
                    icon: Icons.people,
                    text: 'Kontak Darurat Pasien',
                  ),
                  _buildOptionItem(
                    context,
                    icon: Icons.star,
                    text: 'Rating',
                  ),
                  _buildOptionItem(
                    context,
                    icon: Icons.lock,
                    text: 'Ubah Kata Sandi',
                  ),
                  _buildOptionItem(
                    context,
                    icon: Icons.exit_to_app,
                    text: 'Keluar',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem({
    required String title,
    required TextEditingController controller,
    bool enabled = true,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: controller,
                    enabled: enabled,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionItem(BuildContext context,
      {required IconData icon, required String text}) {
    return InkWell(
      onTap: () {
        if (text == 'Keluar') {
          _logout();
        } else if (text == 'Kontak Darurat Pasien') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Keluarga()),
          );
        } else if (text == 'Ubah Kata Sandi') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SetPass()),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
