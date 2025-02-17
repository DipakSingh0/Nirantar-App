import 'package:nira/imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _containers = [];

  // var currentPage = DrawerSections.homepage;
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
        extendBody: true,
        drawer: MyDrawer(),
        // bottomNavigationBar: MyBottomBarWidget(),
        // appBar: MyAppBar(title: 'H O M E P A G E',),
        appBar: MyAppBar(title: 'H O M E P A G E' , 
        // leadingIcon:  ,
        actionIcon: Icons.person,
        onActionIconPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage())),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //......................StaticUserContainer Widget.......................//
                    // StaticUserContainer(
                    //   childName: 'Rasma Kumar',
                    //   parentName: 'Mr Avishek Kumar',
                    //   dobDate: 'January 15, 2025',
                    //   bedNumber: '18',
                    //   contactNumber: '+9779876543212',
                    // ),
                    // StaticUserContainer(
                    //   childName: '',
                    //   parentName: '',
                    //   dobDate: '',
                    //   bedNumber: '',
                    //   contactNumber: '',
                    // ),
                    StaticUserContainer(
                      childName: 'Rasma Kumar', 
                      parentName:  'Mr Avishek Kumar', 
                      dobDate: 'January 15, 2025', 
                      // bedNumber: bedNumber, 
                      contactNumber: '+9779876543212', 
                      gender: 'Female', 
                      weight: '3.2 kg', 
                      address: 'Durbar Square, Ktm'),
                    

              //..............This is to create dynamic list of containers................//
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: _containers.length,
                        itemBuilder: (context, index) {
                          return _containers[index];
                        },
                        shrinkWrap: true,
                      ),
                    ),
                    const SizedBox(height: 30)
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            DialogBoxWidget.showAddDialog(context, _addContainer);
          },
          child: const Icon(Icons.add),
        ),
        // floatingActionButtonLocation: CustomFloatingActionButtonLocation(),
      ),
    );
  }

//..............Dynamically created Container...................//
  void _addContainer() {
    setState(() {
      _containers.add(_buildContainer(_containers.length + 1));
    });
  }

  void _deleteContainer(int index) {
    if (index >= 0 && index < _containers.length) {
      setState(() {
        _containers.removeAt(index);
      });
    }
  }



  
  Widget _buildContainer(int index) {
    var theme = Theme.of(context) ;

  
    return GestureDetector(
      // Opens the dialog to add a new child on tap
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => PatientPage())),
      // Deletes the container on long press
      onLongPress: () => DialogBoxWidget.showDeleteDialog(
        context,
        index,
        () => _deleteContainer(index),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: 200,
          width: 480,
          margin: const EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            color: theme.cardTheme.color,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.grey,
              width: 0.2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 5.0, top: 8.0, bottom: 8.0, right: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          spacing: 8,
                          children: [
                            Text(
                              "Name: XYZ",
                              style: theme.textTheme.bodyLarge,
                            ),
                            Text(
                              "Parent Name:\nABC",
                              style: theme.textTheme.bodyLarge,
                            ),
                            Text(
                              "Bed Number: 5",
                              style: theme.textTheme.bodyLarge,
                            ),
                            Text(
                              "DOB:2081-05-12",
                              style: theme.textTheme.bodyLarge,
                            ),
                            Text(
                              "Parent Contact:\n9841514131",
                              style: theme.textTheme.bodyLarge,
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
                      crossAxisSpacing: 6.0,
                      mainAxisSpacing: 6.0,
                      children: [
                         UserdataContainer(
                          icon: Icon(Icons.heart_broken,
                              size: 45, color: theme.iconTheme.color),
                          parameterName: "Heart Rate",
                          value: patientData["heart_rate"] ?? "N/A",
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
