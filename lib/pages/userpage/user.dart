import 'package:flutter/material.dart';
// import 'users_data_graphs/bar_chart.dart';
// import 'users_data_graphs/linechart.dart';
import 'users_data_graphs/max_min_chart.dart';
import 'blooddata_page.dart';
import 'userwidget/userdata_container.dart';
// import 'package:projet/pages/notifications/heartrate_controller.dart';

class User1 extends StatelessWidget {
  const User1({super.key});

  // final HeartRateNotificationController heartRateController =
  //     HeartRateNotificationController();

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // var screenHeight = MediaQuery.of(context).size.height;
    // var screenWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    int heartRate = 10;
    // heartRateController.checkHeartRate(heartRate);

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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // SizedBox(height: screenHeight * 0.020),
                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      UserdataContainer(
                          icon: Icon(Icons.heart_broken,
                              color: theme.iconTheme.color, size: 45),
                          parameterName: "HeartRate",
                          // value: "128",
                          //.... dynamic heart rate to enable notificaion
                          value: heartRate.toString(),

                          //
                          measure: "bpm"),
                      // SizedBox(width: screenWidth * 0.0001),
                      const SizedBox(
                        height: 12,
                      ),

                      // CircularAnimatedWidget(),
                    ],
                  ),
                  // SizedBox(height: screenHeight * 0.015),
                  const SizedBox(
                    height: 12,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      UserdataContainer(
                          icon: Icon(
                            Icons.thermostat,
                            color: theme.iconTheme.color,
                            size: 50,
                          ),
                          parameterName: "Temperature",
                          value: "98.6",
                          measure: "°F"),
                      UserdataContainer(
                          icon: Icon(
                            Icons.air,
                            color: theme.iconTheme.color,
                            size: 45,
                          ),
                          parameterName: "Respiration",
                          value: "75",
                          measure: "/min"),
                    ],
                  ),
                  // SizedBox(height: screenHeight * 0.015),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      UserdataContainer(
                          icon: Icon(
                            Icons.favorite,
                            color: theme.iconTheme.color,
                            size: 45,
                          ),
                          parameterName: "Hemoglobin",
                          value: "13.80",
                          measure: "g/dL"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BlooddataPage()));
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
                      )
                      // Divider(),
                    ],
                  ),
                  // SizedBox(height: screenHeight * 0.015),
                  const SizedBox(
                    height: 12,
                  ),

                  //............... displays saved data displayed on graphs .............//
                  const Divider(),
                  // SizedBox(height: screenHeight * 0.005),
                  const SizedBox(height: 12),

                  Center(
                      child: Text(
                    'Saved Data',
                    style: theme.textTheme.displayLarge,
                  )),

                  // SizedBox(height: screenHeight * 0.005),
                  const SizedBox(height: 12),

                  const Divider(),
                  // SizedBox(height: screenHeight * 0.030),
                  const SizedBox(height: 12),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          // height: screenWidth * 0.6,
                          // width: screenWidth * 1,
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
                      const SizedBox(height: 12),
                      Text(
                        'Heart Rate',
                        style: theme.textTheme.displayLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  const Divider(),

                  // SizedBox(height: screenHeight * 0.030),
                  const SizedBox(height: 12),

                  Column(
                    children: [
                      // Container(
                      //   // height: screenHeight * 0.24,
                      //   // width: screenWidth * 0.9,
                      //   height: 200,
                      //   width: 500,
                      //   decoration: BoxDecoration(
                      //       color: theme.cardColor,
                      //       borderRadius: BorderRadius.circular(20)),
                      //   child: const Padding(
                      //     padding:  EdgeInsets.only(
                      //       top: 5.0,
                      //       // bottom: 8,
                      //       // left: 5,
                      //       right: 5,
                      //     ),
                      //     child: LineChartSample2(),
                      //   ),
                      // ),
                      Text(
                        'Blood Oxygen Level',
                        style: theme.textTheme.displayLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  const Divider(),
                  // SizedBox(height: screenHeight * 0.030),
                  const SizedBox(height: 12),

                  Column(
                    children: [
                      // Container(
                      //   // height: screenWidth * 0.6,
                      //   // width: screenWidth * 0.9,
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
                    ],
                  ),
                  const Divider(),
                  // SizedBox(height: screenHeight * 0.030),
                  const SizedBox(height: 12),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          // height: screenWidth * 0.6,
                          // width: screenWidth * 1,
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
                    ],
                  ),
                  // SizedBox(height: screenHeight * 0.03),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
