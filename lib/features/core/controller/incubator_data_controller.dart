import 'package:flutter/material.dart';
import 'package:nira/features/core/services/incubator_api_service.dart';

class IncubatorController{
  final IncubatorApiService _apiService = IncubatorApiService();

  Future<Map<String, dynamic>> fetchIncubatorData(BuildContext context) async {
    try {
      Map<String, dynamic> fetchedData = await _apiService.fetchIncubatorData();
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
