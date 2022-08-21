import 'dart:async';

import 'package:cypress/splashscreen/splash2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  setSplash() {
    Timer(const Duration(seconds: 3), () {
      onChange();
    });
  }

  onChange() {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            maintainState: true,
            opaque: true,
            pageBuilder: (context, _, __) => Splash2(),
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }));
  }

  @override
  void initState() {
    setSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .4,
          ),
          Image.asset("lib/assets/cy.jpg"),
        ],
      ),
    );
  }
}
