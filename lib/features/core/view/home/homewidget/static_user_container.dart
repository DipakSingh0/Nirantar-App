import 'package:nira/imports.dart';

class StaticUserContainer extends StatelessWidget {
  final String childName;
  final String parentName;
  final String dobDate;
  final String bedNumber;
  final String contactNumber;

  const StaticUserContainer(
      {super.key,
      required this.childName,
      required this.parentName,
      required this.dobDate,
      required this.bedNumber,
      required this.contactNumber});

  @override
  Widget build(BuildContext context) {
    // var screenHeight = MediaQuery.of(context).size.height;
    // var screenWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => User1()),
          );
        },
        child: Container(
          // height: screenHeight / 4.1,
          // width: screenWidth / 1.05,
          height: 240,
          width: 550,
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
                left: 0, top: 8.0, bottom: 6.0, right: 6.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          // spacing: 8,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Name: $childName",
                              style: theme.textTheme.labelLarge,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Parent Name:\n$parentName",
                              style: theme.textTheme.labelLarge,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Bed Number:$bedNumber",
                              style: theme.textTheme.labelLarge,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "DOB:$dobDate",
                              style: theme.textTheme.labelLarge,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Parent Contact:\n$contactNumber",
                              style: theme.textTheme.labelLarge,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        )),
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
                                color: theme.iconTheme.color, size: 25),
                            parameterName: "Heart Rate",
                            value: "120",
                            measure: "/min"),
                        UserdataContainer(
                            icon: Icon(
                              Icons.air,
                              color: theme.iconTheme.color,
                              // size: 25,
                              size: 20,
                            ),
                            parameterName: "Respiration",
                            value: "12",
                            measure: "/min"),
                        UserdataContainer(
                            icon: Icon(
                              Icons.thermostat,
                              color: theme.iconTheme.color,
                              // size: 25,
                              size: 20,
                            ),
                            parameterName: "Temperature",
                            value: "120",
                            measure: "°F"),
                        UserdataContainer(
                            icon: Icon(
                              Icons.bloodtype,
                              color: theme.iconTheme.color,
                              // size: 25,
                              size: 20,
                            ),
                            parameterName: "SpO2",
                            value: "12",
                            measure: "%"),
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
