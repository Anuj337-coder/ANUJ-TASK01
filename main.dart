import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const DayPlannerApp());
}

class DayPlannerApp extends StatelessWidget {
  const DayPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}
