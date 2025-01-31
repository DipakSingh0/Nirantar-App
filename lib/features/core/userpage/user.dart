import 'package:nira/widgets/imports.dart';

class User1 extends StatelessWidget {
  const User1({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    int heartRate = 10;

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 75,
          title: Text(
            'Baby Data',
            style: theme.textTheme.displayLarge,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // GridView for UserdataContainers
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                    value: heartRate.toString(),
                    measure: "bpm",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: CircularAnimatedWidget(),
                  ),
                  UserdataContainer(
                    icon: Icon(
                      Icons.thermostat,
                      color: theme.iconTheme.color,
                      size: 46,
                    ),
                    parameterName: "Temperature",
                    value: "98.6",
                    measure: "°F",
                  ),
                  UserdataContainer(
                    icon: Icon(
                      Icons.air,
                      color: theme.iconTheme.color,
                      size: 45,
                    ),
                    parameterName: "Respiration",
                    value: "75",
                    measure: "/min",
                  ),
                  UserdataContainer(
                    icon: Icon(
                      Icons.favorite,
                      color: theme.iconTheme.color,
                      size: 42,
                    ),
                    parameterName: "Hemoglobin",
                    value: "13.80",
                    measure: "g/dL",
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
                      value: "A+",
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
