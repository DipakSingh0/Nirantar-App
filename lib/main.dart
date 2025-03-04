import 'package:flutter/foundation.dart';
import 'package:nira/features/auth/firebase/firebase_options.dart';
import 'package:nira/imports.dart';

void main() async {
    // testApi(); 
  BindingBase.debugZoneErrorsAreFatal =
      true; // Hides unnecessary O/P at terminal
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(),
      // home: RealTimeChart(),
      // home:DataFetchScreen(),
      // home: PatientPage(),
      // home: RealTimeChart(),
      // home: const IncubatorPage(),
      // home: const IntroScreen(),
    );
  }
}

//apple@gmail.com
