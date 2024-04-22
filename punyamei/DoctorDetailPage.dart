import 'package:flutter/material.dart';

class DoctorDetailPage extends StatelessWidget {
  final String name;
  final String specialization;
  final double rating;
  final String photoUrl;
  final List<String> strNumber;
  final List<String> educationHistory;
  final List<String> practiceHistory;

  DoctorDetailPage({
    required this.name,
    required this.specialization,
    required this.rating,
    required this.photoUrl,
    required this.strNumber,
    required this.educationHistory,
    required this.practiceHistory,
  });

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Dokter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(photoUrl),
            ),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              specialization,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 5),
                Text(
                  '$rating',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildInfoContainer('Nomor STR', strNumber),
                  SizedBox(height: 20),
                  _buildInfoContainer('Riwayat Pendidikan', educationHistory),
                  SizedBox(height: 20),
                  _buildInfoContainer('Riwayat Praktik', practiceHistory),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _buildInfoContainer(String title, List<String> contentList) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 169, 244, 1), // Warna biru
        borderRadius: BorderRadius.circular(10),
        border: Border.all( // Border hitam dengan opacity 1
          color: Colors.black.withOpacity(1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: contentList
                .map((content) => Text(
                      content,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
