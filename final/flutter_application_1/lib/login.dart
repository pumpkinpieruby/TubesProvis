import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/forget.dart';
import 'package:tubes_5_wavecare/homepage.dart';
import 'package:tubes_5_wavecare/infokesehatan.dart';
import 'package:tubes_5_wavecare/newpassword.dart';
import 'package:tubes_5_wavecare/setpassword.dart';
import 'package:tubes_5_wavecare/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    routes: {
      '/': (context) => homepage(),
      '/signup': (context) => SignUp(),
      '/forget': (context) => ForgetPage(),
      '/aturulang': (context) => AturUlang(),
      '/atur': (context) => Aturpassword(),
      '/artikel': (context) => HealthInfoPage(),
      '/isiartikel': (context) => ArticlePage(),

    },
  );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(228, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40), // Menambahkan jarak dari atas
            Center(
              child: Text(
                'Selamat Datang',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00A9FF),
                ),
              ),
            ),
            SizedBox(height: 55),
            Text(
              'Masuk',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Silahkan masukkan email yang terhubung beserta kata sandi.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                color: Color.fromARGB(133, 133, 133, 100),
              ),
            ),
            SizedBox(height: 25),
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
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: 
              GestureDetector(onTap: () {
                Navigator.pushNamed(context, "/forget");
              }, child: Text(
                'Lupa Kata Sandi?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Colors.black,
                ),)
              ),
            ),
            SizedBox(height: 22),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
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
                  width: 220, // Atur lebar tombol
                  child: Center(
                    child: Text(
                      'Masuk',
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
            SizedBox(height: 70), // Menambahkan jarak di antara tombol dan tulisan berikutnya
            Center(
              child: Text(
                'Anda Belum Memiliki Akun?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color:Color(0xFF00A9FF),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/signup");
                  // Aksi saat tombol ditekan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00A9FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Container(
                  width: 150, // Atur lebar tombol
                  child: Center(
                    child: Text(
                      'Buat Akun',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
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
