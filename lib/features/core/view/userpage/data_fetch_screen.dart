import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataFetchScreen extends StatefulWidget {
  const DataFetchScreen({super.key});

  @override
  _DataFetchScreenState createState() => _DataFetchScreenState();
}

class _DataFetchScreenState extends State<DataFetchScreen> {
  final List<Map<String, dynamic>> _dataList = [];
  bool _isLoading = true;
  String _errorMessage = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _fetchData();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    final url = Uri.parse('http://localhost:3000/api/data');

    try {
      final response = await http.get(url);

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Decode the response body
        final Map<String, dynamic> responseData = json.decode(response.body);

        // Add the new data to the list
        setState(() {
          _dataList.insert(
              0, responseData); // Insert at the beginning of the list
          if (_dataList.length > 10) {
            _dataList.removeLast(); // Keep only the last 10 entries
          }
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to load data: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error fetching data: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I N C U B A T O R - D A T A'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _fetchData();
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage))
              : _dataList.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: _dataList.length,
                      itemBuilder: (context, index) {
                        final data = _dataList[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 16.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Heart Rate: ${data['Heart Rate'] ?? 'N/A'}'),
                                Text(
                                    'Body Temperature: ${data['Body Temperature'] ?? 'N/A'}'),
                                Text(
                                    'Respiration Rate: ${data['Respiration Rate'] ?? 'N/A'}'),
                                Text(
                                    'Blood Oxygen Level: ${data['Blood Oxygen Level'] ?? 'N/A'}'),
                                Text(
                                    'Timestamp: ${data['updated_at'] ?? 'N/A'}'),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Center(child: Text('No data available')),
    );
  }
}
