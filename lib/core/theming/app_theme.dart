import 'package:commerce_hub/core/theming/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: ColorsManager.kprimarycolorauth,
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      canvasColor: Colors.white,
      dialogTheme: DialogThemeData(backgroundColor: Colors.white),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 19,
          fontWeight: FontWeight.w700,
          fontFamily: GoogleFonts.cairo().fontFamily,
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: Colors.black,
          fontFamily: GoogleFonts.cairo().fontFamily,
        ),
        bodyMedium: TextStyle(
          color: Colors.black,
          fontFamily: GoogleFonts.cairo().fontFamily,
        ),
        titleLarge: TextStyle(
          color: Colors.black,
          fontFamily: GoogleFonts.cairo().fontFamily,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: Color(0xffE5E5E5),
        thickness: 1,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      colorScheme: ColorScheme.light(
        surface: Colors.white,
        onSurface: Colors.black,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: ColorsManager.kprimarycolorauth,
      scaffoldBackgroundColor: Color(0xFF121212),
      cardColor: Color(0xFF1E1E1E),
      canvasColor: Color(0xFF1E1E1E),
      dialogTheme: DialogThemeData(backgroundColor: Color(0xFF1E1E1E)),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF121212),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 19,
          fontWeight: FontWeight.w700,
          fontFamily: GoogleFonts.cairo().fontFamily,
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white,
          fontFamily: GoogleFonts.cairo().fontFamily,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
          fontFamily: GoogleFonts.cairo().fontFamily,
        ),
        titleLarge: TextStyle(
          color: Colors.white,
          fontFamily: GoogleFonts.cairo().fontFamily,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: Color(0xFF2C2C2C),
        thickness: 1,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      colorScheme: ColorScheme.dark(
        surface: Color(0xFF1E1E1E),
        onSurface: Colors.white,
      ),
    );
  }
}
