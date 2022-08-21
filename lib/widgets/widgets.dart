import 'package:cypress/constants/constants.dart';
import 'package:cypress/models/models.dart';
import 'package:cypress/services/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';

AppBar CypressAppBar(BuildContext context, String title,
    {List<Widget>? actions,
    bool showBack = true,
    bool isImage = false,
    Color? color,
    Color? iconColor,
    Color? textColor}) {
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * .07,

    automaticallyImplyLeading: false,
    elevation: 0,
    // title: isImage ? Image.asset('assets/images/logo.png', height: MediaQuery.of(context).size.height * 0.05,) : Text(title, style: TextStyle(color: appLight_parrot_green),),
    backgroundColor: Colors.grey[800],
    title: Row(
      children: [
        Text(
          appTitle,
          style: GoogleFonts.aBeeZee(
            color: appWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),

    actions: actions,
    iconTheme: IconThemeData(color: Colors.grey[800]),
  );
}
