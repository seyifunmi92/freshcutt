import 'package:cypress/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';

AppBar FreshcuttAppBar(BuildContext context, String title,
    {List<Widget>? actions,
    bool showBack = true,
    bool isImage = false,
    Color? color,
    Color? iconColor,
    Color? textColor}) {
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * .07,

    automaticallyImplyLeading: true,
    elevation: 0,
    // title: isImage ? Image.asset('assets/images/logo.png', height: MediaQuery.of(context).size.height * 0.05,) : Text(title, style: TextStyle(color: appLight_parrot_green),),
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(""),
        Icon(
          Icons.notifications,
          color: Color(0xff42D579),
        ),
      ],
    ),
    // Row(
    //   children: [
    //     Text(
    //       appTitle,
    //       style: GoogleFonts.aBeeZee(
    //         color: appWhite,
    //         fontWeight: FontWeight.w600,
    //       ),
    //     ),
    //   ],
    // ),

    actions: actions,
    iconTheme: IconThemeData(color: Colors.blue[800]),
  );
}
