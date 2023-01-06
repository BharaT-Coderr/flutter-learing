import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  // ignore: non_constant_identifier_names
  static ThemeData LightTheme(BuildContext context) => ThemeData(
        canvasColor: greyishWhite,
        cardColor: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6,
        ),
        // ignore: deprecated_member_use
        accentColor: veryDarkBlue,
        // ignore: deprecated_member_use
        buttonColor: veryDarkBlue,
      );

  // ignore: non_constant_identifier_names
  static ThemeData DarkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        cardColor: Colors.black,
        canvasColor: lightBlack,
        fontFamily: GoogleFonts.poppins().fontFamily,
        // ignore: prefer_const_constructors
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.black,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        // ignore: deprecated_member_use
        buttonColor: Colors.indigo[400],
        // ignore: deprecated_member_use
        accentColor: Colors.white,
      );

  static Color greyishWhite = const Color(0xffff1faee);
  static Color lightBlack = const Color(0xfff212529);
  static Color veryDarkBlue = const Color(0xff012a4a);
}
