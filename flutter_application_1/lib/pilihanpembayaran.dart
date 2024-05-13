import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/detailTagihan.dart';

void main() {
  runApp(const pilihanPembayaran());
}

class pilihanPembayaran extends StatelessWidget {
  const pilihanPembayaran({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const PaymentOptionsPage(),
    );
  }
}

class PaymentOptionsPage extends StatelessWidget {
  const PaymentOptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(228, 255, 255, 255),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => detailTagihan()),
                  );
          },
        ),
        title: Text(
          'Pilihan Pembayaran',
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
            children: [
              SizedBox(height: 10), // Mengatur jarak antara teks dan rectangle box
              GestureDetector(
                onTap: () {
                  // Fungsi untuk pindah ke halaman berikutnya
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => NextPage()),
                  // );
                },
                child: PaymentOptionItem(
                  title: 'Mandiri Transfer',
                  logo: Image.asset('assets/images/mandiri.png'), // Ganti dengan logo yang sesuai
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Fungsi untuk pindah ke halaman berikutnya
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => NextPage()),
                  // );
                },
                child: PaymentOptionItem(
                  title: 'BCA Transfer',
                  logo: Image.asset('assets/images/bca.png'), // Ganti dengan logo yang sesuai
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Fungsi untuk pindah ke halaman berikutnya
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => NextPage()),
                  // );
                },
                child: PaymentOptionItem(
                  title: 'BRI Transfer',
                  logo: Image.asset('assets/images/bri.png'), // Ganti dengan logo yang sesuai
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Fungsi untuk pindah ke halaman berikutnya
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => NextPage()),
                  // );
                },
                child: PaymentOptionItem(
                  title: 'BNI Transfer',
                  logo: Image.asset('assets/images/bni.png'), // Ganti dengan logo yang sesuai
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentOptionItem extends StatelessWidget {
  final String title;
  final Widget logo;

  const PaymentOptionItem({
    Key? key,
    required this.title,
    required this.logo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354,
      height: 93,
      decoration: BoxDecoration(
        color: const Color(0xFFCDF5FD),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          // SizedBox(width: 4), // Memberikan jarak antara teks dan logo
          //  logo,
        ],
      ),
    );
  }
}
