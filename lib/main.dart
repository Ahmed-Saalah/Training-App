import 'package:flutter/material.dart';
import 'package:flutter_application_1/scrrens/sign_In.dart';
import 'package:flutter_application_1/scrrens/splash_screen.dart';

// Run as a Web
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'first flutter app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
