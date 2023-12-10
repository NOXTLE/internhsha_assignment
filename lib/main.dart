import 'package:ap/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build(context) {
    return MaterialApp(
        theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.green)),
        debugShowCheckedModeBanner: false,
        home: const screen());
  }
}
