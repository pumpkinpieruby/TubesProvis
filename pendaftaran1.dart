import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pendaftaran'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


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
            
          ]
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.title,
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 174, 216, 251),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                        Padding(padding: const EdgeInsets.only(left:20),
                      child: Text(
                        'Jadwalkan Pendaftaran',
                        style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        ),
                      ),
                    ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.black,
                    onPressed: (){

                    },
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 174, 216, 251),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                        Padding(padding: const EdgeInsets.only(left:20),
                      child: Text(
                        'Riwayat Pendaftaran',
                        style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        ),
                      ),
                    ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.black,
                    onPressed: (){

                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
