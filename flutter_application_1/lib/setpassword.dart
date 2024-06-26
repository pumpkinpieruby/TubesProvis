import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/homepage.dart';

void main() {
  runApp(SetPass());
}

class SetPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Aturpassword(),
    );
  }
}

class Aturpassword extends StatelessWidget {
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
            // Aksi saat tombol kembali ditekan
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Atur Kata Sandi',
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
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Masukkan Kata Sandi',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(133, 133, 133, 100),
                  ),
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: Color(0xFF00A9FF), 
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
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
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Konfirmasi Kata Sandi',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(133, 133, 133, 100),
                  ),
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: Color(0xFF00A9FF), 
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homepage()),
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
    );
  }
}
