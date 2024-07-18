import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    required this.onTap,
    required this.buttonColor,
    required this.buttonText,
    required this.textColor,
    this.fontSize,
    this.textWeight,
    super.key
    });

  final Function()? onTap;
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final FontWeight? textWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.circular(15),
        elevation: 3.0,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(15),
            child:  Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: textWeight,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
