// app colors
import 'package:flutter/material.dart';

const appColors = ThemeModel(
  black0003: Color.fromRGBO(2, 52, 59, 1),
  black0001: Color.fromRGBO(0, 0, 0, 1),
  black0002: Color.fromRGBO(98, 98, 98, 1),
  green0001: Color.fromRGBO(0, 224, 112, 1),
  green0002: Color.fromRGBO(2, 99, 94, 1),
  blue0001: Color.fromRGBO(60, 119, 245, 1),
  blue0002: Color.fromRGBO(33, 123, 163, 1),
  white0001: Color.fromRGBO(255, 255, 255, 1),
  white0002: Color.fromRGBO(226, 226, 226, 1),
  white0003: Color.fromRGBO(245, 247, 250, 1),
  white: Colors.white,
  black: Colors.black,
  transparent: Colors.transparent,
  greykDADADA: Color(0xFFDADADA),
  bluek2461B3: Color(0XFF2461B3),
  grey1E1E1C: Color(0xFF1E1E1C),
  grey828280: Color(0xFF828280),
  blueE8F0FC: Color(0xFFE8F0FC),
  blue2C64AE: Color(0xFF2C64AE),
  blue061237: Color(0xFF061237),
  blue: Color(0xFF2F80ED),
  darkBlue: Color(0xFF0A1A35),
  lightGrey828280: Color(0xFF828280),
  grey9D9D9D: Color(0xFF9D9D9D),
  greyDADADA: Color(0xFFDADADA),
  blue316CF4: Color(0xFF316CF4),
  greyE8EAED: Color(0xFFE8EAED),
  grey6A7187: Color(0xFF6A7187),
  blue2B63E1: Color(0xFF2B63E1),
  green: Color(0xFF4BD37B),
  red: Color.fromRGBO(132, 4, 4, 1),
  lightBlue: Color(0xFFF2F6FF),
  primary: Color(0xFF01A985),
  secondary: Color(0xFFF0A92B),
  darkSecondary: Color(0xFFB86C0F),
  lighterPrimary: Color(0xFFC1F297),
  armyGreen: Color(0xFF0B4D40),
  lightPrimary: Color(0xFFA5CF61),
  lightestPrimary: Color(0xFFF7FBF1),
  splashGreen: Color(0xffBCEF95),
  darkPrimary: Color(0xFF008067),
  darkerPrimary: Color(0xFF079460),
  darkestPrimary: Color(0xff0A4C3E),
  fadedGreen: Color(0xff83a29a),
  lightDarkPrimary: Color(0xFF94C740),
  lightSecondary: Color(0xFFFDF6EA),
  lighterSecondary: Color(0xFFE09500),
  darkGrey: Color(0xFF282828),
  black282828: Color(0xFF282828),
  black7A7A7A: Color(0xFF7A7A7A),
  blackBFBFBF: Color(0xFFBFBFBF),
  blackEBEBEB: Color(0xFFEBEBEB),
  black4F4F4F: Color(0xFF4F4F4F),
  black434343: Color(0xFF434343),
  danger: Color(0xFFE25A51),
  success: Color(0xFF197527),
  icon: Color(0xFF282828),
  nav: Color(0xFFCACACA),
  grey: Color(0xFF7A7A7A),
  greyFBFCFC: Color(0xFFFBFCFC),
  lightGrey: Color(0xFFEBEBEB),
  lighterGrey: Color(0xFFF4F4F4),
  background: Color(0xFFFBFBFB),
  // black: Colors.black,
  // white: Colors.white,
  // transparent: Colors.transparent,
  textFieldFill: Color(0xFFE5F2F0),
  pink: Color(0xFFF08F5D),
  // lightBlue: Color(0xFF2F80ED),
  fadedBlue: Color(0xFFE8F0FC),
  lighterBlack: Color(0xFF1E1E1C),
  secondaryTextColor: Color(0xFF828280),
  lighterGrey2: Color(0xFFDADADA),
  greyF0F0F0: Color(0xFFF0F0F0),
  blueE8EFFD: Color(0xFFE8EFFD),
  black353535: Color(0xFF353535),

  // blue: Color(0xFF030303),
  shadow: Color(0xFFF1F1F1),
  blue9FC5FF: Color(0xFF9FC5FF),
  blueD5E5FD: Color(0xFFD5E5FD),
  blue1C274C: Color(0xFF1C274C),
  blueC8D8FF: Color(0xFFC8D8FF),
  greyFF474747: Color(0xFF474747),

  kGrey50: Color(0xFFF9FAFB),
  kGrey100: Color(0xFFF3F4F6),
  kGrey500: Color(0xFF6B7280),
  kGrey700: Color(0xFF374151),
  kGrey900: Color(0xFF111827),
  kGreyF7F7F7: Color(0xFFF7F7F7),

  // blue: Color(0xFF2F80ED),
  // lightGrey828280: Color(0xFF828280),
  // grey9D9D9D: Color(0xFF9D9D9D),
  // greyDADADA: Color(0xFFDADADA),
  // blue316CF4: Color(0xFF316CF4),
  // greyE8EAED: Color(0xFFE8EAED),
  // grey6A7187: Color(0xFF6A7187),
  // blue2B63E1: Color(0xFF2B63E1),
  // green: Color(0xFF4BD37B),
  // red: Color(0xFFFF4F4F)
);

// theme model
class ThemeModel {
  const ThemeModel({
    required this.black0001,
    required this.black0002,
    required this.black0003,
    required this.green0001,
    required this.green0002,
    required this.blue0001,
    required this.blue0002,
    required this.white,
    required this.white0001,
    required this.white0002,
    required this.white0003,
    required this.black,
    required this.transparent,
    required this.blue,
    required this.lightGrey828280,
    required this.grey9D9D9D,
    required this.greyDADADA,
    required this.blue316CF4,
    required this.greyE8EAED,
    required this.grey6A7187,
    required this.blue2B63E1,
    required this.green,
    required this.red,
    required this.lightBlue,
    required this.greykDADADA,
    required this.bluek2461B3,
    required this.grey1E1E1C,
    required this.grey828280,
    required this.blueE8F0FC,
    required this.blue2C64AE,
    required this.blue061237,
    required this.primary,
    required this.darkPrimary,
    required this.lightPrimary,
    required this.darkerPrimary,
    required this.darkestPrimary,
    required this.lighterPrimary,
    required this.lightestPrimary,
    required this.lightDarkPrimary,
    required this.secondary,
    required this.darkSecondary,
    required this.lightSecondary,
    required this.lighterSecondary,
    required this.black282828,
    required this.black7A7A7A,
    required this.blackBFBFBF,
    required this.blackEBEBEB,
    required this.black4F4F4F,
    required this.black434343,
    required this.splashGreen,
    required this.armyGreen,
    required this.danger,
    required this.success,
    required this.icon,
    required this.nav,
    // required this.white,
    // required this.black,
    required this.grey,
    required this.greyFBFCFC,
    required this.darkGrey,
    required this.lightGrey,
    required this.lighterGrey,
    required this.background,
    // required this.transparent,
    required this.textFieldFill,
    required this.pink,
    // required this.lightBlue,
    required this.fadedBlue,
    required this.lighterBlack,
    required this.secondaryTextColor,
    required this.lighterGrey2,
    required this.greyF0F0F0,
    required this.blueE8EFFD,
    required this.black353535,
    required this.darkBlue,
    required this.shadow,
    required this.blue9FC5FF,
    required this.blueD5E5FD,
    required this.blue1C274C,
    required this.blueC8D8FF,
    required this.greyFF474747,
    required this.kGrey50,
    required this.kGrey100,
    required this.kGrey500,
    required this.kGrey700,
    required this.kGrey900,
    required this.kGreyF7F7F7,
    required this.fadedGreen,

    // required this.blue,
    // required this.lightGrey828280,
    // required this.grey9D9D9D,
    // required this.greyDADADA,
    // required this.blue316CF4,
    // required this.greyE8EAED,
    // required this.grey6A7187,
    // required this.blue2B63E1,
    // required this.green,
    // required this.red,
  });

  final Color primary;
  final Color secondary;
  final Color black0001;
  final Color black0002;
  final Color green0001;
  final Color green0002;
  final Color blue0001;
  final Color blue0002;
  final Color white0001;
  final Color white0002;
  final Color white0003;
  final Color black0003;

  // primary shades
  final Color lighterPrimary;
  final Color lightPrimary;
  final Color lightestPrimary;
  final Color darkPrimary;
  final Color darkerPrimary;
  final Color darkestPrimary;
  final Color lightDarkPrimary;

  // secondary shades
  final Color darkSecondary;
  final Color lightSecondary;
  final Color lighterSecondary;

  final Color splashGreen;
  final Color armyGreen;

  final Color black282828;
  final Color black7A7A7A;
  final Color blackBFBFBF;
  final Color black4F4F4F;
  final Color blackEBEBEB;
  final Color black434343;

  final Color danger;
  final Color success;
  final Color icon;
  final Color nav;
  final Color grey;
  final Color greyFBFCFC;
  final Color lightGrey;
  final Color lighterGrey;
  final Color background;
  final Color darkGrey;
  final Color textFieldFill;
  final Color pink;
  final Color white;
  final Color black;
  final Color transparent;
  final Color lightBlue;
  final Color darkBlue;
  final Color fadedBlue;
  final Color lighterBlack;
  final Color secondaryTextColor;
  final Color lighterGrey2;
  final Color blue;
  final Color lightGrey828280;
  final Color grey9D9D9D;
  final Color greyDADADA;
  final Color blue316CF4;
  final Color greyE8EAED;
  final Color grey6A7187;
  final Color blue2B63E1;
  final Color green;
  final Color red;
  // final Color lightBlue;
  final Color greykDADADA;
  final Color bluek2461B3;
  final Color grey1E1E1C;
  final Color grey828280;
  final Color greyF0F0F0;
  final Color blueE8F0FC;
  final Color blue2C64AE;
  final Color blue061237;
  final Color blueE8EFFD;
  final Color black353535;
  final Color shadow;
  final Color blue9FC5FF;
  final Color blueD5E5FD;
  final Color blue1C274C;
  final Color blueC8D8FF;
  final Color greyFF474747;

  final Color kGrey50;
  final Color kGrey100;
  final Color kGrey500;
  final Color kGrey700;
  final Color kGrey900;
  final Color kGreyF7F7F7;
  final Color fadedGreen;
}

const List<Color> myCirclesColors = [
  Color(0xFFF7FBF1),
  Color(0xFFE5F2F0),
  Color(0xFFF4F4F4),
];

