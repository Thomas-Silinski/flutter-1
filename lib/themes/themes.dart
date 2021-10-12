import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/constants/colors.dart';

class Themes {
  final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: kSecondaryColor,
    scaffoldBackgroundColor: kSecondaryColor,
    cardColor: kDarkGrey,
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
  );
}
