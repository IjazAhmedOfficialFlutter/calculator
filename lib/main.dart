import 'dart:async';
import 'package:flutter/material.dart';
import 'calculator_home.dart'; // Ensure this file contains your CalculatorApp implementation

void main() {
  runApp(MyApp()); // Start the app with MyApp which includes MaterialApp
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => CalculatorApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/calculator.png',
              width: 100,
              height: 100,
            ), // Load your image here
            SizedBox(height: 20), // Add space between image and text
            Text(
              'Welcome to Simple Calculator', // Your text below the image
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), // Space below the text
            Text(
              'A simple way to perform calculations', // Additional description
              style: TextStyle(
                color: Colors.grey[300], // Light grey for the description
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
