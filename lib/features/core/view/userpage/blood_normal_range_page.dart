import 'package:nira/imports.dart';

class BloodNormalRangePage extends StatefulWidget {
  const BloodNormalRangePage({super.key});

  @override
  State<BloodNormalRangePage> createState() => _BloodNormalRangePageState();
}

class _BloodNormalRangePageState extends State<BloodNormalRangePage> {
  final Map<String, String> normalRanges = {
    'RBC': '4.5 - 5.5 x10^12/L',
    'WBC': '4,000 - 11,000 /µL',
    'Haemoglobin': '13 - 16 g/dL',
    'Platelets': '150,000 - 400,000 /µL',
    'MCV': '80 - 100 fL',
    'MCH': '27 - 32 pg',
    'MCHC': '32 - 36 g/dL',
    'RDW': '11 - 14 %',
    'Neutrophil': '40 - 75 %',
    'Lymphocytes': '20 - 40 %',
    'Eosinophils': '1 - 6 %',
    'Monocytes': '2 - 10 %',
    'Basophils': '0 - 1 %',
    'RDWSD': '39 - 46 fL',
    'RDWCV': '11.5 - 14.5 %',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'BLOOD DATA RANGE'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: const Text(
                  'Normal Blood Data Range',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
          
              // Generate rows for each test and its normal range
              ...normalRanges.entries.map((entry) {
                return _buildInfoRow(entry.key, entry.value);
              }),
          
              // Removed all the hardcoded patient and medical info rows
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
