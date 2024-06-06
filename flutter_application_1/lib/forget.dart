import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/newpassword.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ForgetPage(),
    );
  }
}

class ForgetPage extends StatelessWidget {
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
            Navigator.pop(context);
            // Aksi saat tombol kembali ditekan
          },
        ),
        title: Text(
          'Lupa Kata Sandi',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00A9FF),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20), // Jarak setelah judul
            Text(
              'Untuk mengatur ulang kata sandi, harap masukkan email yang terhubung.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                color: Color.fromARGB(118, 85, 68, 68),
              ),
            ),
            SizedBox(height: 25), // Jarak setelah teks
            Text(
              'Email',
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
            SizedBox(height: 70), // Jarak setelah field email
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AturUlang()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00A9FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Container(
                  width: 150, // Lebar tombol
                  child: Center(
                    child: Text(
                      'Kirim Email',
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
    );
  }
}
