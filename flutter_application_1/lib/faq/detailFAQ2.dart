import 'package:flutter/material.dart';
import 'package:tubes_5_wavecare/faq/FAQ.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const DetailFAQ2());
}

class DetailFAQ2 extends StatelessWidget {
  const DetailFAQ2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      routes: {
        "/kembali": (context) => Faq(),
      },
      home: const MyHomePage(idFaq: 2),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int idFaq;

  const MyHomePage({required this.idFaq, Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic>? faqDetail;

  @override
  void initState() {
    super.initState();
    fetchFAQDetail(widget.idFaq);
  }

  Future<void> fetchFAQDetail(int idFaq) async {
    final url = Uri.parse('http://127.0.0.1:8001/faq/getFAQ/$idFaq');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        faqDetail = json.decode(response.body);
      });
    } else {
      print('Failed to fetch FAQ detail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/kembali");
              },
              child: const Icon(Icons.arrow_back, color: Colors.black),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
      body: faqDetail == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    faqDetail!['judul_faq'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 174, 216, 251),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: Text(
                      faqDetail!['deskripsi_faq'],
                      style: const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
