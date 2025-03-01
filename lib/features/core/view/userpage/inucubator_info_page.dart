import 'package:nira/imports.dart';

class InucubatorInfoPage extends StatefulWidget {
  const InucubatorInfoPage({super.key});

  @override
  State<InucubatorInfoPage> createState() => _InucubatorInfoPageState();
}

class _InucubatorInfoPageState extends State<InucubatorInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'I N C U B A T O R - I N F O'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Incubator Data Normal Range',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildInfoRow('Incubator Temperature Range', '97.5°F - 99.5°F'),
            _buildInfoRow('Humidity', '60% - 80%'),
            _buildInfoRow('Oxygen Level', '90% - 95%'),
            _buildInfoRow('Air Quality', '- - -'),
         SizedBox(height: 16),
            // Text(
            //   'Medical Information',
            //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            // ),
            // SizedBox(height: 10),
            // _buildInfoRow('Birth Condition', 'Normal Delivery'),
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
