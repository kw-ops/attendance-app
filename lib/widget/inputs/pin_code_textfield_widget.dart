import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../const/constants.dart';


class UniversalPinCodeField extends StatelessWidget {
  const UniversalPinCodeField(
      {super.key,
      this.controller,
      required this.onDone,
      this.shape,
      this.fieldHeight,
      this.fieldWidth,
      this.borderRadius,
      required this.length,
      required this.obsucureText,
      this.borderWidth,
      this.inactiveBorderWidth});

  final TextEditingController? controller;
  final Function(String)? onDone;
  final PinCodeFieldShape? shape;
  final double? fieldHeight;
  final double? fieldWidth;
  final BorderRadius? borderRadius;
  final double? borderWidth;
  final int length;
  final bool obsucureText;
  final double? inactiveBorderWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PinCodeTextField(
        controller: controller,
        appContext: context,
        autoDisposeControllers: false,
        focusNode: FocusNode(),
        obscureText: obsucureText,
        showCursor: false,
        length: length,
        animationType: AnimationType.fade,
        keyboardType: TextInputType.number,
        pinTheme: PinTheme(
          fieldHeight: fieldHeight ?? 20,
          fieldWidth: fieldWidth ?? 20,
          shape: shape ?? PinCodeFieldShape.circle,
          activeColor: appColors.greyE8EAED,
          inactiveBorderWidth: inactiveBorderWidth ?? 1,
          // disabledColor: appColors.white,
          inactiveColor: appColors.grey6A7187,
          selectedColor: appColors.blue2B63E1,
          inactiveFillColor: appColors.white,
          selectedFillColor: appColors.white,
          activeFillColor: appColors.white,
          fieldOuterPadding: const EdgeInsets.all(5),
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(0),
              ),
          // borderWidth: borderWidth ?? 1
        ),
        mainAxisAlignment: MainAxisAlignment.center,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        useHapticFeedback: true,
        onCompleted: onDone,
        onChanged: (_) {},
      ),
    );
  }
}
