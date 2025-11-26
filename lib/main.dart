import 'package:flutter/material.dart';
import 'data/sample_data.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(const MyApp());
}

// =======================
// Root Aplikasi
// =======================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Classroom',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(user: sampleUser),
    );
  }
}

