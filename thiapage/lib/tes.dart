// import 'package:flutter/material.dart';



// class TanggalLahirWidget extends StatefulWidget {
//   @override
//   _TanggalLahirWidgetState createState() => _TanggalLahirWidgetState();
// }

// class _TanggalLahirWidgetState extends State<TanggalLahirWidget> {
//   DateTime _selectedDate;

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Tanggal Lahir',
//           style: TextStyle(
//             fontFamily: 'Poppins',
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         SizedBox(height: 8),
//         InkWell(
//           onTap: () {
//             _selectDate(context);
//           },
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: Colors.grey),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(
//                   _selectedDate == null
//                       ? 'Pilih Tanggal'
//                       : '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: _selectedDate == null
//                         ? Color.fromARGB(133, 133, 133, 100)
//                         : Colors.black,
//                   ),
//                 ),
//                 Icon(Icons.calendar_today),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('Date Picker Example'),
//       ),
//       body: Center(
//         child: TanggalLahirWidget(),
//       ),
//     ),
//   ));
// }
