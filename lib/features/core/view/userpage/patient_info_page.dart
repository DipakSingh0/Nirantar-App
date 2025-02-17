import 'package:nira/imports.dart';

class PatientInfoPage extends StatefulWidget {
  const PatientInfoPage({super.key});

  @override
  State<PatientInfoPage> createState() => _PatientInfoPageState();
}

class _PatientInfoPageState extends State<PatientInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'P A T I E N T - I N F O'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patient Details',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildInfoRow('Name', 'Rasma Kumar'),
            _buildInfoRow('Date of Birth', 'January 15, 2025'),
            _buildInfoRow('Gender', 'Female'),
            _buildInfoRow('Weight', '3.2 kg'),
            _buildInfoRow('Blood Group', 'O+'),
            _buildInfoRow('Mothers Name', 'Mrs Priyanka Chopra'),
            _buildInfoRow('Fathers Name', 'Mr Avishek Kumar'),
            _buildInfoRow('Contact Number', '+9779876543212'),
            _buildInfoRow('Emergency Contact', '+9779878675645'),
            _buildInfoRow('Address', ',Durbar Square, Kathmandu, Nepal'),
            SizedBox(height: 16),
            Text(
              'Medical Information',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildInfoRow('Birth Condition', 'Normal Delivery'),
          ],
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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}