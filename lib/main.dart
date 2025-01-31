import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nira/firebase_options.dart';
import 'package:nira/features/auth/introscreens/introduction_screen.dart';
// import 'firebase_api.dart';
// import 'pages/home/home_page.dart';
import 'widgets/theme/theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  BindingBase.debugZoneErrorsAreFatal =true; // hides unnecessary O/P at terminal
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // FirebaseApi firebaseApi = FirebaseApi();
  // await firebaseApi.initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      // home: const HomePage(),
      home: const IntroScreen(),

      //  navigatorKey: navigatorKey,
      //  routes: {
      //   '/notification_page': (context) => const NotificationsPage(),
      //  },
    );
  }
}
