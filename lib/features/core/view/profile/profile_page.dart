import 'package:nira/imports.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    // var screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: theme.appBarTheme.backgroundColor,

          title: Text('P R O F I L E', style: theme.textTheme.displayLarge),
          // leading: Icon(Icons.arrow_back , color: Colors.white,),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            // Top section with background color and profile
            Container(
              color: theme.cardColor,
              height: screenHeight * 0.43,
            ),

            // Profile Image and Name
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        // Profile image
                        AvatarGlowWidget(
                          theme: theme,
                          // height: 140 , width: 140,
                        ),

                        // Edit icon
                        Positioned(
                          right: 1,
                          bottom: 1,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                // color: AppColors.listTileBgColor,
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: theme.iconTheme.color,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Profile name text
                    Text(
                      "Nirantar Hospital",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.displayMedium,
                    ),
                  ],
                ),
              ),
            ),

            // Centered white container
            Positioned(
              top: screenHeight * 0.26,
              left: 20,
              right: 20,
              child: Container(
                height: 480,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: AppColors.listTileBgColor,
                  color: theme.cardColor,
                ),
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /// edit profile list tile
                      CustomProfileListTile(
                        profileTitleText: "Hospital Name",
                        onTap: () {},
                        profileLeadingIconName: "edit-icon",
                      ),
                      const CustomDivider(),

                      /// list project list tile
                      CustomProfileListTile(
                        profileTitleText: "List of Wards",
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const WardsPage()));
                        },
                        profileLeadingIconName: "list-icon",
                      ),
                      const CustomDivider(),

                      /// change password list tile
                      CustomProfileListTile(
                        profileTitleText: "Change Password",
                        onTap: () {},
                        profileLeadingIconName: "password-icon",
                      ),
                      const CustomDivider(),

                      /// change email list tile
                      CustomProfileListTile(
                        profileTitleText: "Change Email Address",
                        onTap: () {},
                        profileLeadingIconName: "email-icon",
                      ),
                      const CustomDivider(),

                      /// settings list tile
                      CustomProfileListTile(
                        profileTitleText: "Settings",
                        onTap: () {},
                        profileLeadingIconName: "setting-icon",
                      ),
                      const CustomDivider(),

                      /// preferences list tile
                      CustomProfileListTile(
                        profileTitleText: "Preferences",
                        onTap: () {},
                        profileLeadingIconName: "preferences-icon",
                      ),
                      const CustomDivider(),

                      /// logout list tile
                      CustomLogoutListTile(
                        profileTitleText: "Log Out",
                        onTap: () {},
                        profileLeadingIconName: "logout-icon",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
