import 'package:nira/features/core/view/userpage/blood_normal_range_page.dart';
import 'package:nira/imports.dart';

class BloodDataPage extends StatefulWidget {
  const BloodDataPage({super.key});

  @override
  State<BloodDataPage> createState() => _BloodDataPageState();
}

class _BloodDataPageState extends State<BloodDataPage> {
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
    var theme = Theme.of(context);

    return Scaffold(
              backgroundColor: theme.scaffoldBackgroundColor,
        appBar: MyAppBar(
            title: 'B L O O D - R E P O R T',
            leadingIcon: Icons.arrow_back,
            onLeadingIconPressed: () => Navigator.pop(context),
            actionIcon: Icons.info,
            onActionIconPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BloodNormalRangePage(),
                  ));
            }),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: const Text(
                  'Blood Report',
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



// import 'package:nira/features/core/view/userpage/blood_normal_range_page.dart';
// import 'package:nira/imports.dart';

// class BlooddataPage extends StatelessWidget {
//   const BlooddataPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: theme.scaffoldBackgroundColor,
//         appBar: MyAppBar(
//             title: 'B L O O D - R E P O R T',
//             leadingIcon: Icons.arrow_back,
//             onLeadingIconPressed: () => Navigator.pop(context),
//             actionIcon: Icons.info,
//             onActionIconPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => BloodNormalRangePage(),
//                   ));
//             }),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: GridView.count(
//             crossAxisCount: 2,
//             crossAxisSpacing: 8.0,
//             mainAxisSpacing: 8.0,
//             childAspectRatio: 1.2,
//             children: [
//               UserdataContainer(
//                 icon: Icon(
//                   Icons.bloodtype,
//                   color: theme.iconTheme.color,
//                   size: 45,
//                 ),
//                 parameterName: "RBC Count",
//                 value: "4.0",
//                 measure: "M/mm³",
//               ),
//               UserdataContainer(
//                 icon: Icon(
//                   Icons.bloodtype,
//                   color: theme.iconTheme.color,
//                   size: 45,
//                 ),
//                 parameterName: "Spo2",
//                 value: "4.0",
//                 measure: "M/mm³",
//               ),
//               UserdataContainer(
//                 icon: Icon(
//                   Icons.bloodtype,
//                   color: theme.iconTheme.color,
//                   size: 45,
//                 ),
//                 parameterName: "WBC Count",
//                 value: "10,000",
//                 measure: "/mm³",
//               ),
//               UserdataContainer(
//                 icon: Icon(
//                   Icons.bloodtype,
//                   color: theme.iconTheme.color,
//                   size: 45,
//                 ),
//                 parameterName: "Platelets",
//                 value: "10,000",
//                 measure: "/mm³",
//               ),
//               UserdataContainer(
//                 icon: Icon(
//                   Icons.bloodtype,
//                   color: theme.iconTheme.color,
//                   size: 45,
//                 ),
//                 parameterName: "Haemoglobin",
//                 value: "13.80",
//                 measure: "g/dL",
//               ),
//               UserdataContainer(
//                 icon: Icon(
//                   Icons.bloodtype,
//                   color: theme.iconTheme.color,
//                   size: 45,
//                 ),
//                 parameterName: "Neutrophil",
//                 value: "12000",
//                 measure: "/mm³",
//               ),
//               UserdataContainer(
//                 icon: Icon(
//                   Icons.bloodtype,
//                   color: theme.iconTheme.color,
//                   size: 45,
//                 ),
//                 parameterName: "Esonophil",
//                 value: "300",
//                 measure: "/mm³",
//               ),
//               UserdataContainer(
//                 icon: Icon(
//                   Icons.bloodtype,
//                   color: theme.iconTheme.color,
//                   size: 45,
//                 ),
//                 parameterName: "MCV",
//                 value: "110",
//                 measure: "fL",
//               ),
              
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
