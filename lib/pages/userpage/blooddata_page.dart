import 'package:flutter/material.dart';
// import 'package:projet/pages/userpage/userwidget/circular_animated_widget.dart';

import 'userwidget/userdata_container.dart';

class BlooddataPage extends StatelessWidget {
  const BlooddataPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,

        // backgroundColor: Colors.grey[200],
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: theme.appBarTheme.backgroundColor,
          title: Text(
            'B L O O D - D A T A',
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
                  //....................... realtime  parameters ........................//

                  SizedBox(height: screenHeight * 0.025),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UserdataContainer(
                          icon: Icon(
                            Icons.bloodtype,
                            color: theme.iconTheme.color,
                            size: 45,
                          ),
                          parameterName: "RBC Count",
                          value: "4.0",
                          measure: "M/mm³"),
                      SizedBox(width: screenWidth * 0.0005),
                      // CircularAnimatedWidget(),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.015),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      UserdataContainer(
                          icon: Icon(
                            Icons.bloodtype,
                            color: theme.iconTheme.color,
                            size: 45,
                          ),
                          parameterName: "WBC Count",
                          value: "10,000",
                          measure: "/mm³"),
                      UserdataContainer(
                          icon: Icon(
                            Icons.bloodtype,
                            color: theme.iconTheme.color,
                            size: 45,
                          ),
                          parameterName: "Platelets",
                          value: "10,000",
                          measure: "/mm³"),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.015),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      UserdataContainer(
                          icon: Icon(
                            Icons.bloodtype,
                            color: theme.iconTheme.color,
                            size: 45,
                          ),
                          parameterName: "Haemoglobin",
                          value: "13.80",
                          measure: "g/dL"),
                      UserdataContainer(
                        icon: Icon(
                          Icons.bloodtype,
                          color: theme.iconTheme.color,
                          size: 45,
                        ),
                        parameterName: "Neutrophil",
                        value: "12000",
                        measure: "/mm³",
                      ),
                      // Divider(),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.015),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      UserdataContainer(
                          icon: Icon(
                            Icons.bloodtype,
                            color: theme.iconTheme.color,
                            size: 45,
                          ),
                          parameterName: "Esonophil",
                          value: "300",
                          measure: "/mm³"),
                      UserdataContainer(
                        icon: Icon(
                          Icons.bloodtype,
                          color: theme.iconTheme.color,
                          size: 45,
                        ),
                        parameterName: "MCV",
                        value: "110",
                        measure: "fL",
                      ),
                      // Divider(),
                    ],
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
