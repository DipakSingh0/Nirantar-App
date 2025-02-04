import 'package:nira/imports.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var currentPage = DrawerSections.homepage;

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const MyHeaderDrawer(),
            const SizedBox(
              height: 10,
            ),
            myDrawerList(),
          ],
        ),
      ),
    );
  }

  Widget myDrawerList() {
    var theme = Theme.of(context);
    return Container(
      color: theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          const CustomDivider(),
          menuItem(1, "Profile", Icons.dashboard_outlined,
              currentPage == DrawerSections.homepage ? true : false),
          const CustomDivider(),
          menuItem(2, "Contacts", Icons.perm_contact_calendar_rounded,
              currentPage == DrawerSections.homepage ? true : false),
          const CustomDivider(),
          menuItem(3, "Notifications", Icons.notifications,
              currentPage == DrawerSections.homepage ? true : false),
          const CustomDivider(),
          menuItem(4, "Settings", Icons.settings,
              currentPage == DrawerSections.homepage ? true : false),
          const CustomDivider(),
          menuItem(5, "Privacy Policy", Icons.privacy_tip_sharp,
              currentPage == DrawerSections.homepage ? true : false),
          const CustomDivider(),
          menuItem(6, "Send Feedback", Icons.feedback,
              currentPage == DrawerSections.homepage ? true : false),
          const CustomDivider(),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    var theme = Theme.of(context);
    return Material(
        // color: selected ? Colors.blue[300] : Colors.transparent,
        color: theme.scaffoldBackgroundColor,
        child: InkWell(
            onTap: () {
              Navigator.pop(context);
              setState(() {
                if (id == 1) {
                  currentPage = DrawerSections.homepage;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                } else if (id == 2) {
                  currentPage = DrawerSections.contacts;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactsPage()));
                } else if (id == 3) {
                  currentPage = DrawerSections.notifications;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationsPage()));
                } else if (id == 4) {
                  currentPage = DrawerSections.settings;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                } else if (id == 5) {
                  currentPage = DrawerSections.privacypolicy;
                } else {
                  currentPage = DrawerSections.sendfeedback;
                }
              });
            },
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      icon,
                      size: 22,
                      color: theme.iconTheme.color,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  Expanded(
                    flex: 4,
                    child: Text(title, style: theme.textTheme.displayMedium),
                  ),
                ],
              ),
            )));
  }
}

enum DrawerSections {
  homepage,
  profile,
  contacts,
  notifications,
  settings,
  privacypolicy,
  sendfeedback
}

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
        color: theme.scaffoldBackgroundColor,
        width: double.infinity,
        height: 250,
        padding: EdgeInsets.only(top: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'lib/assets/admin.jpg',
                    ),
                  )),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Nirantar',
              style: theme.textTheme.displayLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'nirantar123@gmail.com',
              style: theme.textTheme.displaySmall,
            ),
          ],
        ));
  }
}
