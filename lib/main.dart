import 'package:flutter/material.dart';
import 'package:la_vie/presenation/resources/theme_manager.dart';
import 'package:la_vie/presenation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getApplicationTheme(),
      home: const SplashScreen(),
    );
  }
}


