import 'package:flutter/material.dart';
import 'HomePage.dart'; // Import the HomePage file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // Home screen set to HomePage
    );
  }
}

