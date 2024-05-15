import 'package:flutter/cupertino.dart';

class Dimensions {
  static late MediaQueryData _mediaQueryData;
  static late double phoneScreenWidth;
  static late double phoneScreenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    phoneScreenWidth = _mediaQueryData.size.width;
    phoneScreenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }

  static double getProportionateScreenWidth(double inputWidth) {
    double screenWidth = Dimensions.phoneScreenWidth;
    double designWidth = 360;
    return (inputWidth / designWidth) * screenWidth;
  }


  double getFontSize(double dimension, Size size) {
    return getScaledDimension(dimension, Dimensions.kStandardWidth, size.width);
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
  double getScaledDimension(
      double desiredDimen, double standardDimen, double deviceDimen) {
    double mxplier = 0;
    double scaledDimen = 0;
    mxplier = desiredDimen / standardDimen;

    scaledDimen = deviceDimen * mxplier;

    return scaledDimen;
  }

  static double getProportionateScreenHeight(double inputHeight) {
    double screenHeight = Dimensions.phoneScreenHeight;
    double designHeight = 800;
    return (inputHeight / designHeight) * screenHeight;
  }

  static Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  
    //getProportionateScreenWidth
   double pSW(double inputWidth) {
    double? screenWidth = Dimensions.phoneScreenWidth;
    double designWidth = isTablet ? 600 : 375;
    return (inputWidth / designWidth) * screenWidth;
  }

   //getProportionateScreenHeight
  double pSH(double inputHeight) {
    double? screenHeight = Dimensions.phoneScreenHeight;
    double designHeight = isTablet ? 926 : 812;
    return (inputHeight / designHeight) * screenHeight;
  }


  static bool get isTablet {
    double width = Dimensions.phoneScreenWidth > Dimensions.phoneScreenHeight
        ? Dimensions.phoneScreenHeight
        : Dimensions.phoneScreenWidth;
    return (width > 599);
  }

  static const double kStandardHeight = 811;
  static const double kStandardWidth = 408;
}

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double screenHeight(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).height / dividedBy;
}

double screenWidth(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).width / dividedBy;
}
