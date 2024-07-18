import 'package:flutter/material.dart';

import '../const/constants.dart';




class MainButton extends StatelessWidget {
  const MainButton(
      {Key? key,
      required this.onTap,
      this.label = 'Button',
      this.labelColor = Colors.white,
      this.labelFontSize,
      this.labelFontWeight,
      required this.mainColor,
      this.strokeColor = Colors.transparent,
      required this.width,
      this.height,
      this.labelStyle,
      this.prefixIcon,
      this.suffixIcon,
      this.horizontalPadding,
      this.verticalPadding,
      this.radius,
      this.active = true,
      this.hasShadow = false,
      this.shadowColor,
      this.inactiveBgColor,
      this.labelTextAlign,
      this.strokeWidth,
      this.gradient,
      this.hasGradient = false, this.borderRadius})
      : super(key: key);

  // final Size size;
  final String label;
  final Color mainColor;
  final Color labelColor;
  final FontWeight? labelFontWeight;
  final double? labelFontSize;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color strokeColor;
  final double width;
  final double? height;
  final Function() onTap;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? radius;
  final bool active;
  final bool hasShadow;
  final Color? inactiveBgColor;
  final Color? shadowColor;
  final TextAlign? labelTextAlign;
  final double? strokeWidth;
  final Gradient? gradient;
  final bool hasGradient;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
        onTap: active ? onTap : () {},
        child: Container(
            width: width > 0 ? width : null,
            height: height,
            decoration: BoxDecoration(
                borderRadius:  BorderRadius.all(Radius.circular(borderRadius ?? 20)),
                color: active
                    ? mainColor
                    : (inactiveBgColor ??
                        mainColor.withOpacity(0.3) /*.kGrey500*/),
                border: strokeColor != Colors.transparent
                    ? Border.all(
                        color: strokeColor,
                        width: strokeWidth ?? (size.height * 0.0025 /*2.0*/))
                    : Border.all(width: 0, color: Colors.transparent),
                boxShadow: hasShadow
                    ? [
                        BoxShadow(
                          color: shadowColor != null
                              ? shadowColor!.withOpacity(0.2)
                              : Colors.grey.withOpacity(0.2),
                          offset: const Offset(2.0, 3.0), //(x,y)
                          blurRadius: 3.0,
                        ),
                      ]
                    : null,
                gradient: hasGradient
                    ? active
                        ? (gradient ??
                            LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [appColors.blue, appColors.blue316CF4]))
                        : null
                    : gradient),
            child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: verticalPadding ?? (size.height * 0.02 /*16.0*/),
                    horizontal: 0
                    //  width == 0
                    //     ? getScaledDimension(
                    //         16, Palette.kStandardWidth, size.width)
                    //     : horizontalPadding ?? 0

                    ),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(children: [
                    prefixIcon ?? const SizedBox.shrink(),
                    Expanded(
                      child: Text(label,
                          textAlign: labelTextAlign ?? TextAlign.center,
                          style: labelStyle ??
                              TextStyle(
                                  fontSize: labelFontSize ??
                                      (size.height * 0.017 /*14*/),
                                  color: labelColor,
                                  letterSpacing: 0.004,
                                  fontWeight:
                                      labelFontWeight ?? FontWeight.w500)),
                    ),
                    suffixIcon ?? const SizedBox.shrink()
                  ]),
                ))));
  }
}

class MainButton1 extends StatelessWidget {
  const MainButton1({
    Key? key,
    required this.onTap,
    this.label = 'Button',
    this.labelColor = Colors.white,
    this.labelFontSize,
    this.labelFontWeight,
    required this.mainColor,
    this.strokeColor = Colors.transparent,
    this.width = double.infinity,
    this.height,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.horizontalPadding,
    this.verticalPadding,
    this.radius,
    this.hasShadow = false,
    this.shadowColor,
    this.inactiveBgColor,
    this.labelTextAlign,
    this.strokeWidth,
    this.gradient,
    this.hasGradient = false,
    this.isDisabled,
  }) : super(key: key);

  // final Size size;
  final String label;
  final Color mainColor;
  final Color labelColor;
  final FontWeight? labelFontWeight;
  final double? labelFontSize;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color strokeColor;
  final double width;
  final double? height;
  final Function() onTap;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? radius;
  final bool hasShadow;
  final Color? inactiveBgColor;
  final Color? shadowColor;
  final TextAlign? labelTextAlign;
  final double? strokeWidth;
  final Gradient? gradient;
  final bool hasGradient;
  final bool Function()? isDisabled;

  @override
  Widget build(BuildContext context) {
    final isButtonDisabled = isDisabled?.call() ?? false;

    Size size = MediaQuery.of(context).size;
    return InkWell(
        onTap: isButtonDisabled ? null : onTap,
        child: Container(
            width: width > 0 ? width : null,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 20)),
                color: !isButtonDisabled
                    ? mainColor
                    : (inactiveBgColor ??
                        mainColor.withOpacity(0.3) /*.kGrey500*/),
                border: strokeColor != Colors.transparent
                    ? Border.all(
                        color: strokeColor,
                        width: strokeWidth ?? (size.height * 0.0025 /*2.0*/))
                    : Border.all(width: 0, color: Colors.transparent),
                boxShadow: hasShadow
                    ? [
                        BoxShadow(
                          color: shadowColor != null
                              ? shadowColor!.withOpacity(0.2)
                              : Colors.grey.withOpacity(0.2),
                          offset: const Offset(2.0, 3.0), //(x,y)
                          blurRadius: 3.0,
                        ),
                      ]
                    : null,
                gradient: hasGradient
                    ? !isButtonDisabled
                        ? (gradient ??
                            LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [appColors.blue, appColors.blue316CF4]))
                        : null
                    : gradient),
            child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: verticalPadding ?? (size.height * 0.02 /*16.0*/),
                    horizontal: 0
                    //  width == 0
                    //     ? getScaledDimension(
                    //         16, Palette.kStandardWidth, size.width)
                    //     : horizontalPadding ?? 0

                    ),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(children: [
                    prefixIcon ?? const SizedBox.shrink(),
                    Expanded(
                      child: Text(label,
                          textAlign: labelTextAlign ?? TextAlign.center,
                          style: labelStyle ??
                              TextStyle(
                                  fontSize: labelFontSize ??
                                      (size.height * 0.017 /*14*/),
                                  color: labelColor,
                                  letterSpacing: 0.004,
                                  fontWeight:
                                      labelFontWeight ?? FontWeight.w500)),
                    ),
                    suffixIcon ?? const SizedBox.shrink()
                  ]),
                ))));
  }
}
