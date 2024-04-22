import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HealthInfoPage(),
    );
  }
}

class HealthInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(228, 255, 255, 255),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            // Aksi saat tombol ditekan
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
              padding: const EdgeInsets.symmetric(
                  horizontal: 35.0), // Padding samping kiri dan kanan
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(15), // Sudut yang dibulatkan
                  color: Colors.lightBlue[100], // Warna biru muda untuk latar belakang
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.grey, width: 2.0), // Border bawah
                  ),
                ),
                padding: EdgeInsets.all(35), // Padding untuk isi box
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20), // Spasi sebelum konten tambahan
                    _buildDetailItem(
                        title: 'Nama Lengkap', content: 'XXXX XXXXX'),
                    SizedBox(height: 10),
                    _buildDetailItem(
                        title: 'Nomor Telepon', content: '08123456789'),
                    SizedBox(height: 10),
                    _buildDetailItem(
                        title: 'Alamat Email', content: 'yyyy@gmail.com'),
                    SizedBox(height: 10),
                    _buildDetailItem(title: 'NIK', content: 'XXXXXXXXXXXXX'),
                    SizedBox(height: 10),
                    _buildDetailItem(
                        title: 'Nomor BPJS', content: 'XXXXXXXXXXXX'),
                    SizedBox(height: 10),
                    _buildDetailItem(
                        title: 'Tanggal Lahir', content: 'XX/XX/XXXX'),
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
                  _buildOptionItem(context, icon: Icons.people, text: 'Keluarga'),
                  _buildOptionItem(context, icon: Icons.star, text: 'Rating'),
                  _buildOptionItem(context, icon: Icons.lock, text: 'Ubah Kata Sandi'),
                  _buildOptionItem(context, icon: Icons.exit_to_app, text: 'Keluar'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem({required String title, required String content}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10), // Padding vertikal
      child: Row(
        children: [
          Expanded(
            // Menggunakan Expanded di luar Container untuk memperpanjang border
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.grey,
                      width: 2.0), // Border bawah untuk setiap item
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
                  Text(
                    content,
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

  Widget _buildOptionItem(BuildContext context, {required IconData icon, required String text}) {
    return InkWell(
      onTap: () {
        // Aksi saat opsi diklik
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Option: $text'),
              content: Text('You tapped on the $text option.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10), // Padding vertikal
        child: Row(
          children: [
            Icon(icon), // Ikon opsi
            SizedBox(width: 10), // Spasi antara ikon dan teks
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
              ),
            ), // Teks opsi
          ],
        ),
      ),
    );
  }
}
