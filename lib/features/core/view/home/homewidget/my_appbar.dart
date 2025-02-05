// import 'package:nira/imports.dart'; // Adjust the import path as needed

// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;

//   const MyAppBar({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     return AppBar(
//       toolbarHeight: 75,
//       backgroundColor: theme.appBarTheme.backgroundColor,
//       title: Text(
//         title,
//         style: theme.textTheme.displayLarge,
//       ),
//       centerTitle: true,
//       leading: Builder(
//         builder: (BuildContext context) {
//           return IconButton(
//             icon: Icon(
//               Icons.menu,
//               color: theme.iconTheme.color,
//               size: 32,
//             ),
//             onPressed: () {
//               Scaffold.of(context).openDrawer();
//             },
//           );
//         },
//       ),
//       actions: [
//         InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ProfilePage()),
//             );
//           },
//           child: Padding(
//             padding: const EdgeInsets.only(right: 10.0),
//             child: Icon(
//               Icons.person,
//               color: theme.iconTheme.color,
//               size: 32,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(75);
// }
