import 'package:flutter/material.dart';
import '../../const/constants.dart';


class UniversalElevatedAppButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String text;
  final Color? textButtonColor;
  final Color? buttonColor;
  final double? borderRadius;
  final double? height;
  final double? fontsize;
  final bool Function()? isDisabled;

  const UniversalElevatedAppButton({
    Key? key,
    required this.onpressed,
    required this.text,
    this.textButtonColor,
    this.buttonColor,
    this.borderRadius,
    this.height,
    this.fontsize,
    this.isDisabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isButtonDisabled = isDisabled?.call() ?? false;

    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width, height: height ?? 80),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            buttonColor ?? appColors.blue,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 7),
            ),
          ),
        ),
        onPressed: isButtonDisabled ? null : onpressed,
        child: Text(
          text,
          style: TextStyle(
            color: textButtonColor ?? appColors.white,
            fontSize: fontsize ?? 18,
            fontWeight: FontWeight.w600,
            //fontFamily: 'Outfit',
          ),
        ),
      ),
    );
  }
}

class UniversalTextAppButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String text;
  final Color? textButtonColor;
  final Color? buttonColor;
  final double? borderRadius;
  final double? height;
  final double? fontsize;
  const UniversalTextAppButton(
      {Key? key,
      required this.onpressed,
      required this.text,
      this.textButtonColor,
      this.buttonColor,
      this.borderRadius,
      this.height,
      this.fontsize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width, height: height ?? 80),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            buttonColor ?? appColors.blue,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 7),
            ),
          ),
        ),
        onPressed: onpressed,
        child: Text(
          text,
          style: TextStyle(
            color: textButtonColor ?? appColors.white,
            fontSize: fontsize ?? 18,
            fontWeight: FontWeight.w600,
            //fontFamily: 'Outfit',
          ),
        ),
      ),
    );
  }
}

class UniversalOutlineAppButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String text;
  final Color? textButtonColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? height;
  final double? fontsize;
  const UniversalOutlineAppButton(
      {Key? key,
      required this.onpressed,
      required this.text,
      this.textButtonColor,
      this.borderRadius,
      this.fontsize,
      this.height,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width, height: height ?? 80),
      child: OutlinedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(
              color: borderColor ?? appColors.white,
              width: 1.0,
              style: BorderStyle.solid)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 7),
            ),
          ),
        ),
        onPressed: onpressed,
        child: Text(
          text,
          style: TextStyle(
            color: textButtonColor ?? appColors.white,
            fontSize: fontsize ?? 16,
            fontWeight: FontWeight.w500,
            ////fontFamily: 'Outfit',
          ),
        ),
      ),
    );
  }
}
