import 'dart:async';

import 'package:newstoday/views/navbar.dart';
import 'package:flutter/material.dart';

class SpalshScree extends StatefulWidget {
  const SpalshScree({super.key});

  @override
  State<SpalshScree> createState() => _SpalshScreeState();
}

class _SpalshScreeState extends State<SpalshScree> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => NavBar(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 150,
          height: 150,
          child: Image.asset(
            "assets/logo/newslogof1.png",
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
