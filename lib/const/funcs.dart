// ignore_for_file: unused_local_variable

import 'dart:async';
import 'package:flutter/material.dart';
//import 'colors.dart';
import 'dimensions.dart';

double getScaledDimension(
    double desiredDimen, double standardDimen, double deviceDimen) {
  double mxplier = 0;
  double scaledDimen = 0;
  mxplier = desiredDimen / standardDimen;

  scaledDimen = deviceDimen * mxplier;

  return scaledDimen; 
}

double getFontSize(double dimension, Size size) {
  return getScaledDimension(dimension, Dimensions.kStandardWidth, size.width);
}

double getHorizontalDimension(double dimension, Size size) {
  return getScaledDimension(dimension, Dimensions.kStandardWidth, size.width);
}

double getVerticalDimension(double dimension, Size size) {
  return getScaledDimension(dimension, Dimensions.kStandardHeight, size.height);
}

Widget createSpace(Size size, double dimension, String direction) {
  return direction.toLowerCase() == 'vertical'
      ? SizedBox(
          height: getScaledDimension(
              dimension, Dimensions.kStandardHeight, size.height))
      : SizedBox(
          width: getScaledDimension(
              dimension, Dimensions.kStandardWidth, size.width));
}

void clearPreviousScreensAndReturnToWidget(
    BuildContext context, Widget widget) async {
  await Future.delayed(const Duration(milliseconds: 100), () {});
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => widget,
      ),
      /*ModalRoute.withName("/")*/ (Route<dynamic> route) => false);
}
