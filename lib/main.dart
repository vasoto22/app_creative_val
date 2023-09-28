import 'package:app_creative_val/firebase_options.dart';
import 'package:app_creative_val/src/core/features/auth/presentation/pages/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      routes: {
        'login': (_) => LoginScreen(),
      },
      initialRoute: 'login',
    );
  }
}
