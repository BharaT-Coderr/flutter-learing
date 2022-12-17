import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int day = 1;
  final String name = "Bharat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to my $day day code by $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
