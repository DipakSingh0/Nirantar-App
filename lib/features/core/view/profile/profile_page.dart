import 'package:nira/imports.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: MyAppBar(
          title: 'P R O F I L E',
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: Stack(
          children: [
            Container(
              color: theme.cardColor,
              height: MediaQuery.of(context).size.height * 0.43,
            ),
            const ProfileHeaderWidget(),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.26,
              left: 20,
              right: 20,
              child: const ProfileOptionsList(),
            ),
          ],
        ),
      ),
    );
  }
}



class ProfileOptionsList extends StatelessWidget {
  const ProfileOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final logoutController = LogoutController(context: context);

    return Container(
      height: 480,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).cardColor,
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomProfileListTile(
              profileTitleText: "Hospital Name",
              onTap: () {},
              profileLeadingIconName: "edit-icon",
            ),
            const CustomDivider(),
            CustomProfileListTile(
              profileTitleText: "List of Wards",
              onTap: () {},
              profileLeadingIconName: "list-icon",
            ),
            const CustomDivider(),
            CustomProfileListTile(
              profileTitleText: "Change Password",
              onTap: () {},
              profileLeadingIconName: "password-icon",
            ),
            const CustomDivider(),
            CustomProfileListTile(
              profileTitleText: "Change Email Address",
              onTap: () {},
              profileLeadingIconName: "email-icon",
            ),
            const CustomDivider(),
            CustomProfileListTile(
              profileTitleText: "Settings",
              onTap: () {},
              profileLeadingIconName: "setting-icon",
            ),
            const CustomDivider(),
            CustomProfileListTile(
              profileTitleText: "Preferences",
              onTap: () {},
              profileLeadingIconName: "preferences-icon",
            ),
            const CustomDivider(),
            CustomProfileListTile(
              profileTitleText: "Log Out",
              onTap: logoutController.signOut ,
              profileLeadingIconName: "logout-icon",
            ),
          ],
        ),
      ),
    );
  }
}
