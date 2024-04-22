import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Bagaimana Cara Mengubah Kata Sandi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Positioned(
              top: 0,
              child: Icon(Icons.arrow_back, color: Colors.black,),
            ),
            // Widget Text yang menampilkan judul dihapus
          ]
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              height: 500,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 174, 216, 251),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey, width: 2)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text('1. Cari menu atau opsi pengaturan akun.',
                  style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                  ),
                  Text('2. Masuk ke pengaturan akun.',
                  style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                  ),
                  Text('3. Pilih keamanan atau privasi.',
                  style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                  ),
                  Text('4. Ganti kata sandi.',
                  style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                  ),
                  Text('5. Verifikasi identitas.',
                  style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                  ),
                  Text('6. Ikuti petunjuk yang disediakan.',
                  style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                  ),
                  Text('7. Simpan perubahan.',
                  style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
