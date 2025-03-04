// // import 'package:nira/imports.dart';

// // class InucubatorInfoPage extends StatefulWidget {
// //   const InucubatorInfoPage({super.key});

// //   @override
// //   State<InucubatorInfoPage> createState() => _InucubatorInfoPageState();
// // }

// // class _InucubatorInfoPageState extends State<InucubatorInfoPage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: MyAppBar(title: 'I N C U B A T O R - I N F O'),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               'Incubator NormalData Range',
// //               style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
// //             ),
// //             SizedBox(height: 16),
// //             _buildInfoRow('Incubator Temperature', '97.5°F - 99.5°F'),
// //             _buildInfoRow('Humidity', '60% - 80%'),
// //             _buildInfoRow('Oxygen Level', '90% - 95%'),
// //             _buildInfoRow('Air Quality', '- - -'),
// //          SizedBox(height: 16),
// //             Text(
// //               'RealTime Information',
// //               style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
// //             ),
// //             SizedBox(height: 10),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildInfoRow(String label, String value) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 6.0),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(
// //             label,
// //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
// //           ),
// //           Text(
// //             value,
// //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';
// import 'package:nira/imports.dart'; // Assuming this contains MyAppBar and other imports

// class InucubatorInfoPage extends StatefulWidget {
//   const InucubatorInfoPage({super.key});

//   @override
//   State<InucubatorInfoPage> createState() => _InucubatorInfoPageState();
// }

// class _InucubatorInfoPageState extends State<InucubatorInfoPage> {
//   final List<Map<String, dynamic>> _dataList = [];
//   bool _isLoading = true;
//   String _errorMessage = '';
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//     _startTimer();
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
//       _fetchData();
//     });
//   }

//   Future<void> _fetchData() async {
//     final url = Uri.parse(
//         'http://192.168.1.100:3000/api/data'); // Replace with your machine's IP

//     try {
//       final response = await http.get(url);

//       print('Response status code: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         try {
//           final Map<String, dynamic> responseData = json.decode(response.body);

//           setState(() {
//             _dataList.insert(
//                 0, responseData); // Insert at the beginning of the list
//             if (_dataList.length > 10) {
//               _dataList.removeLast(); // Keep only the last 10 entries
//             }
//             _isLoading = false;
//           });
//         } catch (e) {
//           print('JSON parsing error: $e');
//           setState(() {
//             _errorMessage = 'Invalid data format';
//             _isLoading = false;
//           });
//         }
//       } else {
//         setState(() {
//           _errorMessage = 'Failed to load data: ${response.statusCode}';
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       print('Network error: $e');
//       setState(() {
//         _errorMessage = 'Error fetching data: ${e.toString()}';
//         _isLoading = false;
//       });
//     }
//   }

//   Widget _buildInfoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//           ),
//           Text(
//             value,
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(
//         title: 'I N C U B A T O R - I N F O',
//         leadingIcon: Icons.arrow_back,
//         onLeadingIconPressed: () => Navigator.pop(context),
//         actionIcon: Icons.refresh,
//         onActionIconPressed: _fetchData,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Incubator Info Section
//               Text(
//                 'Incubator Normal Data Range',
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 16),
//               _buildInfoRow('Incubator Temperature', '97.5°F - 99.5°F'),
//               _buildInfoRow('Humidity', '60% - 80%'),
//               _buildInfoRow('Oxygen Level', '90% - 95%'),
//               _buildInfoRow('Air Quality', '- - -'),
//               SizedBox(height: 16),

//               // IoT Data Section
//               Text(
//                 'IoT Data',
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 16),
//               _isLoading
//                   ? Center(child: CircularProgressIndicator())
//                   : _errorMessage.isNotEmpty
//                       ? Center(child: Text(_errorMessage))
//                       : _dataList.isNotEmpty
//                           ? ListView.builder(
//                               shrinkWrap: true,
//                               physics: NeverScrollableScrollPhysics(),
//                               padding: const EdgeInsets.all(16.0),
//                               itemCount: _dataList.length,
//                               itemBuilder: (context, index) {
//                                 final data = _dataList[index];
//                                 return Card(
//                                   margin: const EdgeInsets.only(bottom: 16.0),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(16.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                             'Heart Rate: ${data['Heart Rate'] ?? 'N/A'}'),
//                                         Text(
//                                             'Body Temperature: ${data['Body Temperature'] ?? 'N/A'}'),
//                                         Text(
//                                             'Respiration Rate: ${data['Respiration Rate'] ?? 'N/A'}'),
//                                         Text(
//                                             'Blood Oxygen Level: ${data['Blood Oxygen Level'] ?? 'N/A'}'),
//                                         Text(
//                                             'Timestamp: ${data['updated_at'] ?? 'N/A'}'),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             )
//                           : Center(child: Text('No data available')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
