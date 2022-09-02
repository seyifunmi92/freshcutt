import 'dart:async';
import 'package:cypress/blog/freshcutt.dart';
import 'package:cypress/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';


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
            pageBuilder: (context, _, __) => FreshCutt(),
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
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Image.asset(
            //   "lib/assets/freshcuttt.png",
            //   height: _height * .2,
            // ),
            SizedBox(
              height: _height * .37,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * .15),
                child:
                    Container(child: Image.asset("lib/assets/freshcuttt.png")),
              ),
            ),
            SizedBox(
              height: _height * .1,
            ),

            CircularProgressIndicator(
              color: Colors.amber[900],
              strokeWidth: 10.0,
            ),

            //Sized
          ],
        ),
      ),

      // Alignment(child: Image.asset("lib/assets/kwik3.png")),
    );
  }
}
