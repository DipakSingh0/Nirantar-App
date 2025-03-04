// import 'package:flutter/material.dart';
// import 'package:nira/features/core/services/incubator_api_service.dart';

// class IncubatorController{
//   final IncubatorApiService _apiService = IncubatorApiService();

//   Future<Map<String, dynamic>> fetchIncubatorData(BuildContext context) async {
//     try {
//       Map<String, dynamic> fetchedData = await _apiService.fetchIncubatorData();
//       return fetchedData;
//     } catch (error) {
//       _showErrorDialog(context, error.toString());
//       return {};
//     }
//   }

//   void _showErrorDialog(BuildContext context, String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Error"),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nira/features/core/services/incubator_api_service.dart';

class IncubatorController {
  final IncubatorApiService _apiService = IncubatorApiService();
  final String _blynkToken1 = "nk24hJbhlmcJv9x6n8E49fH-Nx7sMrRb";
  final String _blynkToken2 = "J28OfmH4dpIgVZ0XsOGKFy9J6YTCjdrw";


  Future<Map<String, dynamic>> fetchIncubatorData(BuildContext context) async {
    try {
      Map<String, dynamic> fetchedData = await _apiService.fetchIncubatorData();
      return fetchedData;
    } catch (error) {
      _showErrorDialog(context, error.toString());
      return {};
    }
  }

  // void _showErrorDialog(BuildContext context, String message) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text("Error"),
  //       content: Text(message),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: const Text("OK"),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  // Fetch incubator data (unchanged)
  // Future<Map<String, dynamic>> fetchIncubatorData(BuildContext context) async {
  //   try {
      // Simulate API call (replace with actual API call)
      // await Future.delayed(const Duration(seconds: 1));
      // return {
      //   "co2": 91.5,
      //   "temp": 37.0, 
      //   "humidity": 60.0,
      //   "saline_velocity": 2.5,
      // };
  //        Map<String, dynamic> fetchedData = await _apiService.fetchIncubatorData();
  //     return fetchedData;
  //   } catch (error) {
  //     _showErrorDialog(context, error.toString());
  //     return {};
  //   }
  // }

  // Update temperature control
  Future<void> updateTemperature(double value) async {
    final url = Uri.parse(
        "https://blynk.cloud/external/api/update?token=$_blynkToken1&V3=$value");
    await http.get(url);
  }

  // Update humidity control
  Future<void> updateHumidity(double value) async {
    final url = Uri.parse(
        "https://blynk.cloud/external/api/update?token=$_blynkToken1&V4=$value");
    await http.get(url);
  }

  // Update saline dispense velocity
  Future<void> updateSalineVelocity(double value) async {
    final url = Uri.parse(
        "https://blynk.cloud/external/api/update?token=$_blynkToken2&V2=$value");
    await http.get(url);
  }

  // Show error dialog (unchanged)
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
