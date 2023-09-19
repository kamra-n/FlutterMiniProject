import 'package:flutter/material.dart';
import 'package:miniproject/screens/Main_Screen/MainScreen.dart';
import 'package:miniproject/screens/Onbording_screen/Onbording_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(), home: const Onbording());
  }
}
