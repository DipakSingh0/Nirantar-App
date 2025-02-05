import 'package:nira/imports.dart';

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
                          parameterName: "External Temperature",
                          value:
                              patientData["temperature"]?.toString() ?? "N/A",
                          // value: "98.6",
                          measure: "°F",
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
                          icon: Icon(Icons.thermostat,
                              size: 45, color: theme.iconTheme.color),
                          parameterName: "Body Weight",
                          value: patientData["body_weight"] ?? "N/A",
                          measure: "Kg",
                        ),
                        UserdataContainer(
                          icon: Icon(Icons.water_drop,
                              size: 45, color: theme.iconTheme.color),
                          parameterName: "Humidity",
                          value: patientData["humidity"] ?? "N/A",
                          measure: "%",
                        ),
                        UserdataContainer(
                          icon: Icon(Icons.air,
                              size: 45, color: theme.iconTheme.color),
                          parameterName: "Air Quality",
                          value: patientData["air_quality"] ?? "N/A",
                          measure: "AQI",
                        ),
                        UserdataContainer(
                          icon: Icon(Icons.heart_broken,
                              size: 45, color: theme.iconTheme.color),
                          parameterName: "Heart Rate",
                          value: patientData["heart_rate"] ?? "N/A",
                          measure: "bpm",
                        ),
                        UserdataContainer(
                          icon: Icon(Icons.water_drop,
                              size: 45, color: theme.iconTheme.color),
                          parameterName: "SpO2",
                          value: patientData["spo2"] ?? "N/A",
                          measure: "%",
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BlooddataPage(),
                              ),
                            );
                          },
                          child: UserdataContainer(
                            icon: Icon(
                              Icons.bloodtype,
                              color: theme.iconTheme.color,
                              size: 45,
                            ),
                            parameterName: "Blood Data",
                            value: "",
                            measure: "",
                          ),
                        ),
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
                          borderRadius: BorderRadius.circular(20)),
                      child: const BarChartSample3(),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Respiration Rate',
                      style: theme.textTheme.displayLarge,
                    ),

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
