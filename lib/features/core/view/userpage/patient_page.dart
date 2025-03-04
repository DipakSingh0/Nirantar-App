import 'package:nira/features/core/graphs/line_chart_4.dart';
import 'package:nira/features/core/view/userpage/incubator_data_screen.dart';
import 'package:nira/imports.dart';
import 'package:nira/features/core/widgets/custom_nav_button.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  final PatientController _controller = PatientController();
  Map<String, dynamic> patientData = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPatientData();
  }

  Future<void> _loadPatientData() async {
    setState(() {
      isLoading = true;
    });

    Map<String, dynamic> fetchedData =
        await _controller.fetchPatientData(context);

    setState(() {
      patientData = fetchedData;
      isLoading = false;
    });
  }
  List<Map<String, dynamic>> chartData = [
    {'x': 0, 'y': 4},
    {'x': 1, 'y': 3.5},
    {'x': 2, 'y': 4.5},
    {'x': 3, 'y': 1},
    {'x': 4, 'y': 4},
    {'x': 5, 'y': 6},
    {'x': 6, 'y': 6.5},
    {'x': 7, 'y': 6},
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: MyAppBar(
            title: 'P A T I E N T - D A T A',
            leadingIcon: Icons.arrow_back,
            onLeadingIconPressed: () => Navigator.pop(context),
            actionIcon: Icons.info,
            onActionIconPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientInfoPage(),
                  ));
            }),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    // GridView for UserdataContainers
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1.5,
                      ),
                      children: [
                        CustomNavigationButton(
                          icon: Icons.lightbulb_circle,
                          pageName: "Incubator",
                          targetPage: IncubatorPage(),
                        ),
                        CustomNavigationButton(
                          icon: Icons.bloodtype_outlined,
                          pageName: "Blood Data",
                          targetPage: BloodDataPage(),
                        ),

                        UserdataContainer(
                          icon: Icon(
                            Icons.heart_broken,
                            color: theme.iconTheme.color,
                            size: 45,
                          ),
                          parameterName: "HeartRate",
                          // value: heartRate.toString(),
                          value: patientData["heart_rate"]?.toString() ?? "N/A",
                          measure: "bpm",
                        ),
                        UserdataContainer(
                          icon: Icon(
                            Icons.air,
                            color: theme.iconTheme.color,
                            size: 45,
                          ),
                          parameterName: "Respiration",
                          value:
                              patientData["respiration"]?.toString() ?? "N/A",
                          measure: "/min",
                        ),
                       
                        UserdataContainer(
                          icon: Icon(
                            Icons.thermostat,
                            color: theme.iconTheme.color,
                            size: 46,
                          ),
                          parameterName: "Body Temperature",
                          value: patientData["body_temp"]?.toString() ?? "N/A",
                          // value: "98.6",
                          measure: "°F",
                        ),
                        UserdataContainer(
                          icon: Icon(Icons.medical_services,
                              size: 45, color: theme.iconTheme.color),
                          parameterName: "Saline Volume",
                          value: patientData["saline_volume"] ?? "N/A",
                          measure: "ml",
                        ),
                        UserdataContainer(
                          icon: Icon(
                            Icons.scale,
                            size: 45, 
                            color: theme.iconTheme.color),
                          parameterName: "Body Weight",
                          value: patientData["body_weight"] ?? "N/A",
                          measure: "Kg",
                        ),
                        UserdataContainer(
                          icon: Icon(Icons.heart_broken,
                              size: 45, color: theme.iconTheme.color),
                          parameterName: "Blood Pressure",
                          value: patientData["blood_pressure"] ?? "N/A",
                          measure: "mmHg",
                        ),
                        // UserdataContainer(
                        //   icon: Icon(Icons.water_drop,
                        //       size: 45, color: theme.iconTheme.color),
                        //   parameterName: "SpO2",
                        //   value: patientData["spo2"] ?? "N/A",
                        //   measure: "%",
                        // ),
                      
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Divider and charts/graphs
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      'Saved Data',
                      style: theme.textTheme.displayLarge,
                    ),
                    const Divider(),
                    const SizedBox(height: 8),

                    // Chart/graph widgets
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 200,
                        width: 500,
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: WeeklyBarChart(
                            minValues: [120, 130, 125, 125, 128, 135, 132],
                            maxValues: [160, 180, 175, 170, 165, 160, 158],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Heart Rate',
                      style: theme.textTheme.displayLarge,
                    ),
                    const Divider(),
                    const SizedBox(height: 8),

                    Container(
                      height: 200,
                      width: 500,
                      decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 5.0,
                          // bottom: 8,
                          // left: 5,
                          right: 5,
                        ),
                        child: LineChartSample2(),
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      'Blood Oxygen Level',
                      style: theme.textTheme.displayLarge,
                    ),

                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),

                    Container(
                      height: 200,
                      width: 500,
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                          right: 5,
                        ),
                        child: LineChartSample4(
                          data: chartData,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      'Respiration Rate',
                      style: theme.textTheme.displayLarge,
                    ),

                    const SizedBox(height: 8),

                    // Container(
                    //   height: 200,
                    //   width: 500,
                    //   decoration: BoxDecoration(
                    //       color: theme.cardColor,
                    //       borderRadius: BorderRadius.circular(20)),
                    //   child: const BarChartSample3(),
                    // ),
                    // const SizedBox(height: 10),
                    // Text(
                    //   'Respiration Rate',
                    //   style: theme.textTheme.displayLarge,
                    // ),

                    const Divider(),
                    const SizedBox(height: 12),

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 200,
                        width: 500,
                        decoration: BoxDecoration(
                            color: theme.cardColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 10.0,
                            bottom: 10,
                            left: 5,
                            right: 10,
                          ),
                          child: WeeklyBarChart(
                            minValues: [120, 130, 125, 125, 128, 135, 132],
                            maxValues: [160, 180, 175, 170, 165, 160, 158],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'SpO2',
                      style: theme.textTheme.displayLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
