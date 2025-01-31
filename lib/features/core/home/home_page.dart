import 'package:nira/widgets/imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _containers = [];

  // var currentPage = DrawerSections.homepage;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        extendBody: true,
        drawer: MyDrawer(),
        // bottomNavigationBar: MyBottomBarWidget(),
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: theme.appBarTheme.backgroundColor,
          title: Text(
            'Home Page',
            style: theme.textTheme.displayLarge,
          ),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                  color: theme.iconTheme.color,
                  size: 32,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child:
                    Icon(Icons.person, color: theme.iconTheme.color, size: 32),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //......................StaticUserContainer Widget.......................//
                    StaticUserContainer(
                      // userName: 'hary',
                      childName: 'Mukeshar',
                      parentName: 'Avishek Kumar',
                      dobDate: '2060/01/01',
                      bedNumber: '18',
                      contactNumber: '9841919333',
                    ),
                    StaticUserContainer(
                      // userName: 'hary',
                      childName: '',
                      parentName: '',
                      dobDate: '',
                      bedNumber: '',
                      contactNumber: '',
                    ),
                    StaticUserContainer(
                      // userName: 'hary',
                      childName: '',
                      parentName: '',
                      dobDate: '',
                      bedNumber: '',
                      contactNumber: '',
                    ),

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

//..............Dynamically created Container...................//
  Widget _buildContainer(int index) {
    var theme = Theme.of(context);
    // var screenWidth = MediaQuery.of(context).size.width;
    // var screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      // Opens the dialog to add a new child on tap
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => User1())),
      // Deletes the container on long press
      onLongPress: () => DialogBoxWidget.showDeleteDialog(
        context,
        index,
        () => _deleteContainer(index),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          // height: screenHeight / 4.1,
          // width: screenWidth / 1.05,
          height: 200,
          width: 500,
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
                          // spacing: 8,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              // "Name: " + childName,
                              "Name: ",
                              style: theme.textTheme.bodyLarge,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              // "Parent Name:\n" + parentName,
                              "Parent Name:\n",
                              style: theme.textTheme.bodyLarge,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              // "Bed Number:" + bedNumber,
                              "Bed Number:",
                              style: theme.textTheme.bodyLarge,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              // "DOB:" + dobDate,
                              "DOB:",
                              style: theme.textTheme.bodyLarge,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              // "Parent Contact:\n" + contactNumber,
                              "Parent Contact:\n",
                              style: theme.textTheme.bodyLarge,
                            ),
                            const SizedBox(
                              height: 6,
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
                                color: theme.iconTheme.color, size: 25),
                            parameterName: "Heart Rate",
                            value: "120",
                            measure: "/min"),
                        UserdataContainer(
                            icon: Icon(
                              Icons.air,
                              color: theme.iconTheme.color,
                              size: 25,
                            ),
                            parameterName: "Respiration",
                            value: "12",
                            measure: "/min"),
                        UserdataContainer(
                            icon: Icon(
                              Icons.thermostat,
                              color: theme.iconTheme.color,
                              size: 25,
                            ),
                            parameterName: "Temperature",
                            value: "120",
                            measure: "°F"),
                        UserdataContainer(
                            icon: Icon(
                              Icons.bloodtype,
                              color: theme.iconTheme.color,
                              size: 25,
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
