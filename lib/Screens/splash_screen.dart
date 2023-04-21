import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base/Utils/my_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }

  void whereToGo() {
    Timer(Duration(seconds: 3), () async {
      Navigator.pushNamed(context, MyRoutes.dashBoard);
    });
  }
}

