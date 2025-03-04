// class IotData {
//   final String id;
//   final double heartRate;
//   final double temperature;
//   final double respiration;
//   final double bloodSpO2;
//   final DateTime timestamp;

//   IotData({
//     required this.id,
//     required this.heartRate,
//     required this.temperature,
//     required this.respiration,
//     required this.bloodSpO2,
//     required this.timestamp,
//   });

//   factory IotData.fromJson(Map<String, dynamic> json) {
//     return IotData(
//       id: json['_id'],
//       heartRate: json['heartRate'].toDouble(),
//       temperature: json['temperature'].toDouble(),
//       respiration: json['respiration'].toDouble(),
//       bloodSpO2: json['bloodSpO2'].toDouble(),
//       timestamp: DateTime.parse(json['timestamp']),
//     );
//   }
// }

class IotData {
  final String id;
  final double heartRate;
  final double temperature;
  final double respiration;
  final double bloodSpO2;
  final DateTime timestamp;

  IotData({
    required this.id,
    required this.heartRate,
    required this.temperature,
    required this.respiration,
    required this.bloodSpO2,
    required this.timestamp,
  });

  factory IotData.fromJson(Map<String, dynamic> json) {
    return IotData(
      id: json['_id'],
      heartRate: json['heartRate'].toDouble(),
      temperature: json['temperature'].toDouble(),
      respiration: json['respiration'].toDouble(),
      bloodSpO2: json['bloodSpO2'].toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
