import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final food;

  SecondScreen({this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Container(
          child: Text(food),
        ),
      ),
    );
  }
}
