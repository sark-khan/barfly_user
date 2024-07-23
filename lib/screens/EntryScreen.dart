import 'package:barfly_user/Storage.dart';
import 'package:flutter/material.dart';

class EntryScreen extends StatefulWidget {
  @override
  State createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => navigateToNextPage());
  }

  void navigateToNextPage() {
    String token = Storage.getJwtToken();
    Future.delayed(const Duration(seconds: 1), () {
      if (token.isEmpty) {
        Navigator.of(context).pushReplacementNamed("/login-screen");
      } else {
        Navigator.pushNamed(context, "/home-screen");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
