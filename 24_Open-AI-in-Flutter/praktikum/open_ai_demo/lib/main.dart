import 'package:flutter/material.dart';
import 'package:open_ai_demo/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter OpenAI Demo',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}