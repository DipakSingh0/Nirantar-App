// ignore_for_file: avoid_print
import 'package:nira/features/core/view/userpage/data_fetch_screen.dart';
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

    try {
      Map<String, dynamic> fetchedData =
          await _controller.fetchIncubatorData(context);

      print('Fetched data: $fetchedData'); // Debugging

      setState(() {
        incubatorData = fetchedData;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading incubator data: $e'); // Debugging
      setState(() {
        isLoading = false;
      });
    }
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
                    builder: (context) => DataFetchScreen(),
                  ));
            }),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          measure: "°F",
                        ),
                        UserdataContainer(
                          icon: Icon(Icons.medical_services,
                              size: 45, color: theme.iconTheme.color),
                          parameterName: "Saline Volume",
                          value: incubatorData["saline_volume"]?.toString() ??
                              "N/A",
                          measure: "ml/min",
                        ),
                        UserdataContainer(
                          icon: Icon(Icons.water_drop,
                              size: 45, color: theme.iconTheme.color),
                          parameterName: "Humidity",
                          value: incubatorData["humidity"]?.toString() ?? "N/A",
                          measure: "%",
                        ),
                        UserdataContainer(
                          icon: Icon(Icons.air,
                              size: 45, color: theme.iconTheme.color),
                          parameterName: "Air Quality",
                          value:
                              incubatorData["air_quality"]?.toString() ?? "N/A",
                          measure: "ppm",
                        ),
                        // IncubatorSlider(
                        //   parameterName: "Temperature",
                        //   initialValue: double.tryParse(
                        //           incubatorData["temperature"]?.toString() ??
                        //               "96.0") ??
                        //       96.0,
                        //   minValue: 95.5,
                        //   maxValue: 99.5,
                        //   unit: "°F",
                        //   onValueChanged: (double newValue) {
                        //     print("Temperature Level changed: $newValue");
                        //   },
                        // ),
                        // IncubatorSlider(
                        //   parameterName: "Temperature",
                        //   initialValue: double.tryParse(
                        //           incubatorData["humidity"]?.toString() ??
                        //               "97.0") ??
                        //       97.0,
                        //   minValue: 95.5,
                        //   maxValue: 99.5,
                        //   unit: "°F",
                        //   onValueChanged: (double newValue) {
                        //     print("Temperature changed: $newValue");
                        //   },
                        // ),
                        IncubatorSlider(
                          parameterName: "Temperature",
                          initialValue: double.tryParse(
                                  incubatorData["temperature"]?.toString() ??
                                      "97.0") ??
                              97.0,
                          minValue: 20,
                          maxValue: 99,
                          unit: "%",
                          onValueChanged: (double newValue) {
                            print("Humidity Level changed: $newValue");
                          },
                        ),
                        IncubatorSlider(
                          parameterName: "Humidity",
                          initialValue: double.tryParse(
                                  incubatorData["humidity"]?.toString() ??
                                      "68.0") ??
                              68.0,
                          minValue: 60,
                          maxValue: 80,
                          unit: "%",
                          onValueChanged: (double newValue) {
                            print("Humidity Level changed: $newValue");
                          },
                        ),
                        IncubatorSlider(
                          parameterName: "Oxygen Level",
                          initialValue: double.tryParse(
                                  incubatorData["oxygen"]?.toString() ??
                                      "91.0") ??
                              91.0,
                          minValue: 90,
                          maxValue: 95,
                          unit: "%",
                          onValueChanged: (double newValue) {
                            print("Oxygen Level changed: $newValue");
                          },
                        ),
                        IncubatorSlider(
                          parameterName: "CO2 Level",
                          initialValue: double.tryParse(
                                  incubatorData["co2"]?.toString() ?? "5.2") ??
                              5.2,
                          minValue: 5,
                          maxValue: 10,
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
