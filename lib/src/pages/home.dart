import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      body: SafeArea(child: Body()),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const Card(
        elevation: 0.0,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("Hola"),
        ),
      ),
    );
  }
}
