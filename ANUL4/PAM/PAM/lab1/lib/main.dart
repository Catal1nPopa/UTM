import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:lab1/BmiCalculator.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(), // Use a builder context here
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 211, 217, 229),
      ),
      home: const BmiCalculator(),
    );
  }
}
