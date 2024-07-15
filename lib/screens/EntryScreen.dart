import 'package:flutter/material.dart';

class EntryScreen extends StatefulWidget {
  @override
  State createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return PopScope(
        canPop: true,
        child: Scaffold(
            body: Center(
          child: Image.asset(
            "barfly.png",
            width: 200,
            height: 300,
          ),
        )));
  }
}
