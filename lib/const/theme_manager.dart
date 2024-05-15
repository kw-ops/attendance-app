import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class CustomTheme {
  ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFFF63E49),
      useMaterial3: false,
      scaffoldBackgroundColor: appColors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: appColors.white,
        elevation: 0,
        shape: Border(
          bottom: BorderSide(color: appColors.white),
        ),
        foregroundColor: appColors.greyDADADA,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: appColors.lighterGrey,
        ),
      ),
      canvasColor: appColors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appColors.blue2C64AE,
      ),
      // textButtonTheme: TextButtonThemeData(
      //   style: TextButton.styleFrom(
      //     primary: Colors.white,
      //     backgroundColor: appColors.blue2C64AE,
      //   ),
      // ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
      ).apply(
          displayColor: appColors.armyGreen, bodyColor: appColors.armyGreen),
      fontFamily: 'Inter');

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: appColors.darkGrey,
    scaffoldBackgroundColor:appColors.background,
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      backgroundColor: appColors.darkPrimary,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: appColors.fadedGreen,
      ),
      shape: Border(
        bottom: BorderSide(color: appColors.fadedGreen),
      ),
    ),
    canvasColor: appColors.kGrey700,
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
        displayColor: appColors.darkGrey,
        bodyColor: const Color.fromRGBO(40, 40, 40, 1)),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appColors.blue2C64AE,
        foregroundColor: Colors.white),
    fontFamily: 'Inter',
  );
}
