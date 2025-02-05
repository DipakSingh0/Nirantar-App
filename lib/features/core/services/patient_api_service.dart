// ignore_for_file: avoid_print
import 'package:http/http.dart' as http;

class PatientApiService {
  // List of API URLs
  static const Map<String, String> apiUrls = {
    "temperature":
        "https://blynk.cloud/external/api/get?token=nk24hJbhlmcJv9x6n8E49fH-Nx7sMrRb&V0",
    "humidity":
        "https://blynk.cloud/external/api/get?token=nk24hJbhlmcJv9x6n8E49fH-Nx7sMrRb&V1",
    "air_quality":
        "https://blynk.cloud/external/api/get?token=nk24hJbhlmcJv9x6n8E49fH-Nx7sMrRb&V2",
    "respiration":
        "https://blynk.cloud/external/api/get?token=w2jqWcpxj5IA1w1TKNn9UzU5jxMJW3VQ&V0",
    "spo2":
        "https://blynk.cloud/external/api/get?token=w2jqWcpxj5IA1w1TKNn9UzU5jxMJW3VQ&V1",
    "body_temp":
        "https://blynk.cloud/external/api/get?token=w2jqWcpxj5IA1w1TKNn9UzU5jxMJW3VQ&V2",
    "body_weight":
        "https://blynk.cloud/external/api/get?token=w2jqWcpxj5IA1w1TKNn9UzU5jxMJW3VQ&V3",
    "heart_rate":
        "https://blynk.cloud/external/api/get?token=w2jqWcpxj5IA1w1TKNn9UzU5jxMJW3VQ&V4",
    "saline_volume":
        "https://blynk.cloud/external/api/get?token=J28OfmH4dpIgVZ0XsOGKFy9J6YTCjdrw&V4",
  };

  // Method to GET values dynamically with debug messages
  Future<Map<String, String>> fetchPatientData() async {
    Map<String, String> patientData = {};

    for (String key in apiUrls.keys) {
      try {
        final response = await http.get(Uri.parse(apiUrls[key]!));
        if (response.statusCode == 200) {
          patientData[key] = response.body;
          print("Fetched $key: ${response.body}"); // Debug message
        } else {
          patientData[key] = "N/A";
          print("Failed to fetch $key: Status Code ${response.statusCode}");
        }
      } catch (e) {
        patientData[key] = "Error";
        print("Error fetching $key: $e");
      }
    }
    print("All data fetched successfully.");
    return patientData;
  }

  // Method to POST control values
  Future<bool> postControlValue(String apiUrl, int value) async {
    try {
      final response = await http.get(Uri.parse("$apiUrl=$value"));
      print("Posted value $value to $apiUrl: Status ${response.statusCode}");
      return response.statusCode == 200;
    } catch (e) {
      print("Error posting to $apiUrl: $e");
      return false;
    }
  }
}
