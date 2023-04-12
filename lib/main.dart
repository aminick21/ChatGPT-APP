import 'package:flutter/material.dart';
import 'package:smart_assistant/colors.dart';
import 'package:smart_assistant/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: MyColors.primary,
        scaffoldBackgroundColor: MyColors.secondary,
        primarySwatch: Colors.teal
      ),
      home: HomePage(),
    );
  }
}
