import 'package:http/http.dart' as http;
import 'dart:convert';

void testApi() async {
  final url = Uri.parse('http://127.0.0.1:3000/api/data');
  print("Fetching data from: $url"); // Debugging

  try {
    final response = await http.get(url);
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print("Parsed JSON: $jsonData");
    } else {
      print("Failed to fetch data. Status Code: ${response.statusCode}");
    }
  } catch (e) {
    print("Error fetching data: $e");
  }
}
