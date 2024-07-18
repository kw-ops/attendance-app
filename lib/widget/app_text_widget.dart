import 'package:flutter/material.dart';


class AppTextWidget extends StatelessWidget {
  const AppTextWidget(
      {Key? key,
      required this.text,
      this.fontWeight,
      this.fontsize,
      this.letterspacing,
      this.color,
      this.textAlign,
      this.overflow,
      this.maxlines,
      this.textDecoration})
      : super(key: key);

  final String text;
  final FontWeight? fontWeight;
  final double? fontsize;
  final double? letterspacing;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxlines;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxlines,
      softWrap: true,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: letterspacing,
        //fontFamily: 'Outfit',
      ),
    );
  }
}
