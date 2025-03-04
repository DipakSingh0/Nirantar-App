
// // ignore_for_file: avoid_print

// import 'dart:convert';
// import 'package:nira/features/core/model/iot_data.dart';
// import 'package:http/http.dart' as http;

// class ApiService {
//   final String baseUrl;

//   ApiService(this.baseUrl);

//   Future<List<IotData>> fetchData() async {
//     final url = Uri.parse('$baseUrl/api/data');
//     print("Fetching data from: $url"); // Debugging print

//     try {
//       // final response = await http.get(url);
//       // print("Response Status Code: ${response.statusCode}");
//       final response = await http.get(url);
// //       print("Response Status Code: ${response.statusCode}");

//       if (response.statusCode == 200) {
//         print("Response Body: ${response.body}"); // Print raw response data

//         final List<dynamic> jsonData = json.decode(response.body);
//         print("Parsed JSON: $jsonData"); // Print parsed JSON

//         List<IotData> data =
//             jsonData.map((json) => IotData.fromJson(json)).toList();
//         print("Fetched Data List: $data");

//         return data;
//       } else {
//         print("Failed to load data. Status code: ${response.statusCode}");
//         throw Exception(
//             'Failed to load data. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print("Error fetching data: $e"); // Print any errors
//       throw Exception("Error fetching data: $e");
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nira/features/core/model/iot_data.dart';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<List<IotData>> fetchData() async {
    final url = Uri.parse('$baseUrl/api/data');
    print("Fetching data from: $url"); // Debugging print

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print("Response Body: ${response.body}"); // Print raw response data

        final List<dynamic> jsonData = json.decode(response.body);
        print("Parsed JSON: $jsonData"); // Print parsed JSON

        List<IotData> data =
            jsonData.map((json) => IotData.fromJson(json)).toList();
        print("Fetched Data List: $data");

        return data;
      } else {
        print("Failed to load data. Status code: ${response.statusCode}");
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching data: $e"); // Print any errors
      throw Exception("Error fetching data: $e");
    }
  }
}
