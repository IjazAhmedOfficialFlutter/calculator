import 'package:flutter/material.dart';
import 'Screens/splash_screen.dart'; // Ensure this file contains your CalculatorApp implementation

void main() {
  runApp(MyApp()); // Start the app with MyApp which includes MaterialApp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


