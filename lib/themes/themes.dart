import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/constants/colors.dart';

class Themes {
  final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: kSecondaryColor,
    scaffoldBackgroundColor: kSecondaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kBottonNavigationMenu,
      unselectedItemColor: kDarkGrey,
      selectedItemColor: kPrimaryGradient1.withOpacity(0.8),
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.montserrat(
        fontSize: 30,
        color: Colors.white,
      ),
      headline2: GoogleFonts.montserrat(
        fontSize: 18,
        color: Colors.white,
      ),
      headline3: GoogleFonts.montserrat(
        fontSize: 20,
        color: Colors.white,
      ),
      bodyText1: GoogleFonts.montserrat(
        fontSize: 15,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: kDarkGrey.withOpacity(0.6),
      filled: true,
      contentPadding: const EdgeInsets.only(left: 20),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        // borderSide: BorderSide(color: kSecondaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(50.0),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    ),
  );
}
