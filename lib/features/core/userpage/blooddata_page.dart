import 'package:nira/widgets/imports.dart';

class BlooddataPage extends StatelessWidget {
  const BlooddataPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: theme.appBarTheme.backgroundColor,
          title: Text(
            'B L O O D - D A T A',
            style: theme.textTheme.displayLarge,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 1.2,
            children: [
              UserdataContainer(
                icon: Icon(
                  Icons.bloodtype,
                  color: theme.iconTheme.color,
                  size: 45,
                ),
                parameterName: "RBC Count",
                value: "4.0",
                measure: "M/mm³",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: CircularAnimatedWidget(),
              ),
              UserdataContainer(
                icon: Icon(
                  Icons.bloodtype,
                  color: theme.iconTheme.color,
                  size: 45,
                ),
                parameterName: "WBC Count",
                value: "10,000",
                measure: "/mm³",
              ),
              UserdataContainer(
                icon: Icon(
                  Icons.bloodtype,
                  color: theme.iconTheme.color,
                  size: 45,
                ),
                parameterName: "Platelets",
                value: "10,000",
                measure: "/mm³",
              ),
              UserdataContainer(
                icon: Icon(
                  Icons.bloodtype,
                  color: theme.iconTheme.color,
                  size: 45,
                ),
                parameterName: "Haemoglobin",
                value: "13.80",
                measure: "g/dL",
              ),
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
              UserdataContainer(
                icon: Icon(
                  Icons.bloodtype,
                  color: theme.iconTheme.color,
                  size: 45,
                ),
                parameterName: "Esonophil",
                value: "300",
                measure: "/mm³",
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
