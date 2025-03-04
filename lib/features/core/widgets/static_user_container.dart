import 'package:nira/imports.dart';

class StaticUserContainer extends StatefulWidget {
  final String childName;
  final String parentName;
  final String dobDate;
  final String contact;
  final String gender;
  final String weight;
  final String address;

  const StaticUserContainer(
      {super.key,
      required this.childName,
      required this.parentName,
      required this.dobDate,
      required this.contact,
      required this.gender,
      required this.weight,
      required this.address});

  @override
  State<StaticUserContainer> createState() => _StaticUserContainerState();
}

class _StaticUserContainerState extends State<StaticUserContainer> {
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

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PatientPage()),
          );
        },
        child: Container(
          height: 250,
          width: 540,
          margin: const EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
            color: theme.cardTheme.color,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: theme.scaffoldBackgroundColor,
              width: 0.2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 18, top: 18.0, bottom: 6.0, right: 6.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Column(
                      spacing: 3,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Name: ${widget.childName}",
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Parent:\n${widget.parentName}",
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Gender: ${widget.gender}",
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Weight: ${widget.weight}",
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "DOB:${widget.dobDate}",
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Parent Contact:\n${widget.contact}",
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Address: ${widget.address}",
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      children: [
                        UserdataContainer(
                          icon: Icon(Icons.heart_broken,
                              size: 30, color: theme.iconTheme.color),
                          parameterName: "Heart Rate",
                          value: patientData["heart_rate"] ?? "N/A",
                          measure: "bpm",
                          
                        ),
                        UserdataContainer(
                          icon: Icon(
                            Icons.air,
                            color: theme.iconTheme.color,
                            size: 30,
                          ),
                          parameterName: "Respiration",
                          value:
                              patientData["respiration"]?.toString() ?? "N/A",
                          measure: "/min",
                        ),
                        UserdataContainer(
                          icon: Icon(
                            Icons.health_and_safety,
                            color: theme.iconTheme.color,
                            size: 30,
                          ),
                          parameterName: "Blood Pressure",
                          value:
                              patientData["temperature"]?.toString() ?? "N/A",
                          measure: "mmHg",
                        ),
                        UserdataContainer(
                          icon: Icon(
                            Icons.thermostat,
                            color: theme.iconTheme.color,
                            size: 30,
                          ),
                          parameterName: "Body Temperature",
                          value: patientData["body_temp"]?.toString() ?? "N/A",
                          measure: "°F",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
