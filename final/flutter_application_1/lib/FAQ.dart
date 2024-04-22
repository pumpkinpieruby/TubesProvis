import 'package:flutter/material.dart';
// import 'package:tubes_5_wavecare/homepage.dart';
// import 'pembayaran.dart';
// import 'daftardokter.dart';
// import 'kartu.dart';

void main() {
  runApp(const Faq());
}

class Faq extends StatelessWidget {
  const Faq({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'FAQ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });

  //   // Navigasi ke halaman yang sesuai berdasarkan indeks ikon yang diklik
  //   switch (index) {
  //     case 0:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => homepage()),
  //       );
  //       break;
  //     case 1:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => daftardokter()),
  //       );
  //       break;
  //     case 2:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => kartu()),
  //       );
  //       break;
  //     case 3:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => pembayaran()),
  //       );
  //       break;
  //     case 4:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => Faq()),
  //       );
  //       break;
  //   }
  // }

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView( // Menggunakan SingleChildScrollView untuk memungkinkan scroll
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                              TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari Pertanyaan',
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontFamily: 'Poppins'),
                    filled: true,
                    fillColor: Color.fromARGB(255, 183, 181, 181),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Icon(Icons.search, color: Colors.white),
                  ),
                ),

                SizedBox(height: 20),
                _buildFaqItem('Bagaimana Cara Mengubah Kata Sandi?'),
                SizedBox(height: 20),
                _buildFaqItem('Bagaimana Cara Membuat Janji Temu?'),
                SizedBox(height: 20),
                _buildFaqItem('Bagaimana Cara Pendaftaran Pasien?'),
                SizedBox(height: 20),
                _buildFaqItem('Bagaimana Cara Melihat Rincian Tagihan?'),
                SizedBox(height: 20),
                _buildFaqItem('Bagaimana Cara Melihat Jadwal Dokter?'),
                SizedBox(height: 20),
                _buildFaqItem('Apakah Bisa Membayar Tagihan Rumah Sakit?'),
                SizedBox(height: 20),
                _buildFaqItem('Apakah Ada Tutorial Penggunaan Aplikasi?'),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   // onPressed: () => _onItemTapped(2),
      //   child: Icon(Icons.credit_card),
      //   backgroundColor: Colors.lightBlue[100],
      //   foregroundColor: Colors.black,
      //   elevation: 2.0,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(30.0),
      //   ),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // Tambahkan tombol navigasi di sini
          ],
        ),
      ),
    );
  }

Widget _buildFaqItem(String question) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, "/isidetailfaqnyadisini  ");
    },
    child: Container(
      height: 60,
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 174, 216, 251),
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          question,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    ),
  );
}

}
