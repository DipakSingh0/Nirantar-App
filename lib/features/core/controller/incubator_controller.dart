// import 'package:nira/features/core/services/incubator_api_service.dart';

// class IncubatorController {
//   final IncubatorApiService _apiService = IncubatorApiService();

//   // Method to fetch incubator data
//   // Future<Map<String, dynamic>> fetchIncubatorData() async {
//   //   return await _apiService.fetchIncubatorData();
//   // }

//   // Method to post control values
//   Future<bool> postControlValue(String parameterName, int value) async {
//     String apiUrl;

//     // Determine the API URL based on the parameter name
//     switch (parameterName) {
//       case "Temperature":
//         apiUrl =
//             "https://blynk.cloud/external/api/update?token=nk24hJbhlmcJv9x6n8E49fH-Nx7sMrRb&V3";
//         break;
//       case "Humidity":
//         apiUrl =
//             "https://blynk.cloud/external/api/update?token=nk24hJbhlmcJv9x6n8E49fH-Nx7sMrRb&V4";
//         break;
//       case "Saline Volume":
//         apiUrl =
//             "https://blynk.cloud/external/api/update?token=J28OfmH4dpIgVZ0XsOGKFy9J6YTCjdrw&V2";
//         break;
//       default:
//         throw Exception("Invalid parameter name");
//     }

//     // Call the API service to post the value
//     return await _apiService.postControlValue(apiUrl, value);
//   }
// }
