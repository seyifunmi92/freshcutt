import 'package:cypress/services/service.dart';
import 'package:cypress/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blog/blog.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) {
      ServiceClass();
    },
    child: const Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
  static _HomeState of(BuildContext context) =>
      context.findAncestorStateOfType<_HomeState>()!;
}

class _HomeState extends State<Home> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      title: "Text",
      home: Splash(),
    );
  }

  void changeTheme(ThemeMode _myTheme) {
    setState(() {
      _themeMode = _myTheme;
    });
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreen(),
    );
  }
}
