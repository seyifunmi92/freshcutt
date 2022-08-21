import 'dart:async';

import 'package:cypress/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';

import '../blog/blog.dart';

class Splash2 extends StatefulWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  _Splash2State createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  setSplash() {
    Timer(const Duration(seconds: 5), () {
      onChange();
    });
  }

  onChange() {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            maintainState: true,
            opaque: true,
            pageBuilder: (context, _, __) => Blog(),
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
      //backgroundColor: Colors.black12,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .4,
          ),
          Image.asset("lib/assets/cy.jpg"),
          SizedBox(
            height: MediaQuery.of(context).size.height * .2,
          ),
          CircularProgressIndicator(
            strokeWidth: 10,
            color: Colors.grey[800],
          ),
        ],
      ),
    );
  }
}
