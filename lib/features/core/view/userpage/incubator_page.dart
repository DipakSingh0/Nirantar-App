// ignore_for_file: avoid_print
import 'package:nira/imports.dart';

class IncubatorPage extends StatefulWidget {
  const IncubatorPage({super.key});

  @override
  State<IncubatorPage> createState() => _IncubatorPageState();
}

class _IncubatorPageState extends State<IncubatorPage> {
  final IncubatorController _controller = IncubatorController();
  Map<String, dynamic> incubatorData = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadIncubatorData();
  }

  Future<void> _loadIncubatorData() async {
    setState(() {
      isLoading = true;
    });

    Map<String, dynamic> fetchedData =
        await _controller.fetchIncubatorData(context);

    setState(() {
      incubatorData = fetchedData;
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
            title: 'I N C U B A T O R - D A T A',
            leadingIcon: Icons.arrow_back,
            onLeadingIconPressed: () => Navigator.pop(context),
            actionIcon: Icons.info,
            onActionIconPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InucubatorInfoPage(),
                  ));
            }),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    // GridView for IncubatordataContainers
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
                            Icons.thermostat,
                            color: theme.iconTheme.color,
                            size: 46,
                          ),
                          parameterName: "Incubator Temperature",
                          value:
                              incubatorData["temperature"]?.toString() ?? "N/A",
                          // value: "98.6",
                          measure: "°F",
                        ),
                        UserdataContainer(
                          icon: Icon(Icons.medical_services,
                              size: 45, color: theme.iconTheme.color),
                          parameterName: "Saline Volume",
                          value: incubatorData["saline_volume"] ?? "N/A",
                          measure: "ml",
                        ),
                        UserdataContainer(
                          icon: Icon(Icons.water_drop,
                              size: 45, color: theme.iconTheme.color),
                          parameterName: "Humidity",
                          value: incubatorData["humidity"] ?? "N/A",
                          measure: "%",
                        ),
                        UserdataContainer(
                          icon: Icon(Icons.air,
                              size: 45, color: theme.iconTheme.color),
                          parameterName: "Air Quality",
                          value: incubatorData["air_quality"] ?? "N/A",
                          measure: "AQI",
                        ),
                        IncubatorSlider(
                          parameterName: "Temperature",
                          initialValue: double.tryParse(
                                  incubatorData["oxygen"]?.toString() ??
                                      "N/A") ??
                              21.0,
                          minValue: 10,
                          maxValue: 30,
                          unit:  "°F",
                          onValueChanged: (double newValue) {
                            print("Temperature Level changed: $newValue");
                          },
                        ),
                        IncubatorSlider(
                          parameterName: "Humidity",
                          initialValue: double.tryParse(
                                  incubatorData["co2"]?.toString() ?? "N/A") ??
                              400.0,
                          minValue: 300,
                          maxValue: 2000,
                          unit: "%",
                          onValueChanged: (double newValue) {
                            print("Humidity Level changed: $newValue");
                          },
                        ),
                        IncubatorSlider(
                          parameterName: "Oxygen Level",
                          initialValue: double.tryParse(
                                  incubatorData["co2"]?.toString() ?? "N/A") ??
                              400.0,
                          minValue: 300,
                          maxValue: 2000,
                          unit: "ppm",
                          onValueChanged: (double newValue) {
                            print("Oxygen Level changed: $newValue");
                          },
                        ),
                        IncubatorSlider(
                          parameterName: "CO2 Level",
                          initialValue: double.tryParse(
                                  incubatorData["co2"]?.toString() ?? "N/A") ??
                              400.0,
                          minValue: 300,
                          maxValue: 2000,
                          unit: "%",
                          onValueChanged: (double newValue) {
                            print("CO2 Level changed: $newValue");
                          },
                        ),
                       
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
