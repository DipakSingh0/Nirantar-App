// import 'package:flutter/material.dart';
// import 'package:nira/features/core/model/iot_data.dart';
// import 'package:nira/features/core/services/iot_api_services.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'dart:async';

// class RealTimeChart extends StatefulWidget {
//   const RealTimeChart({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _RealTimeChartState createState() => _RealTimeChartState();
// }

// class _RealTimeChartState extends State<RealTimeChart> {
//   late List<IotData> _data;
//   late ApiService _apiService;

//   @override
//   void initState() {
//     super.initState();
//     _data = [];
//     _apiService = ApiService(
//         'http://192.168.100.228:3000'); // Replace with your backend URL
//     _fetchData();
//     // Poll for new data every 5 seconds
//     Timer.periodic(Duration(seconds: 5), (timer) => _fetchData());
//   }

//   Future<void> _fetchData() async {
//     try {
//       final response = await _apiService.fetchData();
//       setState(() {
//         _data.add(response as IotData);
//         // Keep only the last 10 data points for better performance
//         if (_data.length > 10) {
//           _data.removeAt(0);
//         }
//       });
//     } catch (e) {
//       print('Error fetching data: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Real-Time IoT Data')),
//       body: SfCartesianChart(
//         primaryXAxis: DateTimeAxis(),
//         series: <CartesianSeries<IotData, DateTime>>[
//           LineSeries<IotData, DateTime>(
//             dataSource: _data,
//             xValueMapper: (IotData data, _) => data.timestamp,
//             yValueMapper: (IotData data, _) => data.heartRate,
//             name: 'Heart Rate',
//           ),
//           LineSeries<IotData, DateTime>(
//             dataSource: _data,
//             xValueMapper: (IotData data, _) => data.timestamp,
//             yValueMapper: (IotData data, _) => data.temperature,
//             name: 'Temperature',
//           ),
//           LineSeries<IotData, DateTime>(
//             dataSource: _data,
//             xValueMapper: (IotData data, _) => data.timestamp,
//             yValueMapper: (IotData data, _) => data.respiration,
//             name: 'Respiration',
//           ),
//           LineSeries<IotData, DateTime>(
//             dataSource: _data,
//             xValueMapper: (IotData data, _) => data.timestamp,
//             yValueMapper: (IotData data, _) => data.bloodSpO2,
//             name: 'Blood Spo2',
//           ),
//         ],
//       ),
//     );
//   }
// }
