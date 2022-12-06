import 'package:flutter/material.dart';
import 'package:hbeep/bottom_nav_page.dart';
import 'package:hbeep/main_screen/prediction_page.dart';

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
      title: 'Hbeep',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF002E94),
        )
      ),
      home: BottomNavigationPage(),
    );
  }
}
