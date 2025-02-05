import 'package:flutter/material.dart';
import '../services/patient_api_service.dart';

class PatientController {
  final PatientApiService _apiService = PatientApiService();

  Future<Map<String, dynamic>> fetchPatientData(BuildContext context) async {
    try {
      Map<String, dynamic> fetchedData = await _apiService.fetchPatientData();
      return fetchedData;
    } catch (error) {
      _showErrorDialog(context, error.toString());
      return {};
    }
  }

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
