// import 'package:flutter/material.dart';
// import 'package:nira/widgets/custom_divider.dart';
// import 'package:nira/widgets/my_appbar_widget.dart';
// import 'widgets/listofwards_listtile.dart';

// class WardsPage extends StatelessWidget {
//   const WardsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     return SafeArea(
//         child: Scaffold(
//       // appBar: AppBar(
//       //   toolbarHeight: 75,
//       //   title: const Text('W A R D S',
//       //       style: TextStyle(
//       //         fontSize: 25,
//       //         fontWeight: FontWeight.w500,
//       //         fontFamily: "poppins",
//       //         letterSpacing: 1.5,
//       //         color: theme.t,
//       //       )),
//       //   // leading: Icon(Icons.arrow_back , color: Colors.white,),
//       //   centerTitle: true,
//       // ),
//        appBar: MyAppBar(
//         title: 'W A R D S',
//         // leadingIcon:  ,
//         // actionIcon: Icons.person,
//         // onActionIconPressed: () => Navigator.push(
//         //     context, MaterialPageRoute(builder: (context) => ProfilePage())),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(
//             color: theme.cardColor,
//           ),
//           child: Container(
//             margin: const EdgeInsets.only(
//               top: 20,
//               bottom: 20,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 CustomWardListTile(
//                   profileTitleText: "Ward No 1",
//                   onTap: () {},
//                   profileLeadingIconName: "edit-icon",
//                   totalbednumber: '18',
//                 ),
//                 const CustomDivider(),

//                 CustomWardListTile(
//                   profileTitleText: "Ward No 2",
//                   totalbednumber: '12',
//                   onTap: () {},
//                   profileLeadingIconName: "list-icon",
//                 ),
//                 const CustomDivider(),

//                 CustomWardListTile(
//                   profileTitleText: "Ward No 3",
//                   totalbednumber: '15',
//                   onTap: () {},
//                   profileLeadingIconName: "password-icon",
//                 ),
//                 const CustomDivider(),

//                 CustomWardListTile(
//                   profileTitleText: "Ward No 4",
//                   totalbednumber: '11',
//                   onTap: () {},
//                   profileLeadingIconName: "email-icon",
//                 ),
//                 const CustomDivider(),

//                 CustomWardListTile(
//                   profileTitleText: "Ward No 5",
//                   totalbednumber: '8',
//                   onTap: () {},
//                   profileLeadingIconName: "setting-icon",
//                 ),
//                 const CustomDivider(),

//                 CustomWardListTile(
//                   profileTitleText: "Ward No 6",
//                   totalbednumber: '11',
//                   onTap: () {},
//                   profileLeadingIconName: "preferences-icon",
//                 ),
//                 const CustomDivider(),

//                 CustomWardListTile(
//                   profileTitleText: "Ward No 7",
//                   totalbednumber: '12',
//                   onTap: () {},
//                   profileLeadingIconName: "preferences-icon",
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ));
//   }
// }
