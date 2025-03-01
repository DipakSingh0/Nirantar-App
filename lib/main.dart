import 'package:flutter/foundation.dart';
import 'package:nira/imports.dart'; 

void main() async {
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
      // home: const HomePage(),
      home: const IntroScreen(),
    );
  }
}

//apple@gmail.com