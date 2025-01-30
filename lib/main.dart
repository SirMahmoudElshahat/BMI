import 'package:b_m_i/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColor: Colors.teal,
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white, size: 80),
        textTheme: TextTheme(
            headlineLarge: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            headlineMedium: TextStyle(
                fontSize: 50, fontWeight: FontWeight.w900, color: Colors.white),
            headlineSmall:
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      home: Home(),
    );
  }
}
