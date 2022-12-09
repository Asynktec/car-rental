import 'package:car_rental/src/pages/home.dart';
import 'package:car_rental/src/pages/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Renta de carros',
      home: const HomePage(),
      routes: {
        'home': (context) => const HomePage(),
      },
    );
  }
}
