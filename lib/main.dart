import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple.shade200,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: SplashScreen(),
    );
  }
}
