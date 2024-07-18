import 'package:attendance/const/funcs.dart';
import 'package:attendance/views/homestu.dart';
import 'package:attendance/views/welcome.dart';
import 'package:attendance/widget/app_text_widget.dart';
import 'package:attendance/widget/inputs/inputs.dart';
import 'package:attendance/widget/inputs/pin_code_textfield_widget.dart';
import 'package:attendance/widget/next_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../const/constants.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            nextScreen(context, const HomeScreenStudent());
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              //createSpace(size, 20, 'verticla'),
              AppTextWidget(
                text: 'Verify Course',
                fontsize: getFontSize(20, size),
                fontWeight: FontWeight.bold,
              ),
              createSpace(size, 25, 'vertical'),
              AppTextWidget(
                text:
                    'Enter the 5-digit code mentioned by \nLecturer for verification purpose.',
                fontsize: getFontSize(16, size),
                textAlign: TextAlign.center,
              ),
              createSpace(size, 40, 'vertical'),
              UniversalPinCodeField(
                obsucureText: false,
                length: 5,
                //controller: pinCodeController,
                shape: PinCodeFieldShape.box,
                fieldHeight: Dimensions().pSH(60),
                fieldWidth: Dimensions().pSW(60),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                borderWidth: 1,
                inactiveBorderWidth: 0.2,
                onDone: (results) {},
              ),
              RichText(
                //textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: getFontSize(16, size),
                  ),
                  children: [
                    TextSpan(
                      text: 'Code entered is invalid!',
                      style: TextStyle(color: appColors.black),
                    ),
                    TextSpan(
                      text: ' Please try again.',
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: TextStyle(
                        color: appColors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              createSpace(size, 70, 'vertical'),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: UniversalElevatedAppButton(
                  onpressed: () {},
                  text: 'Submit',
                  buttonColor: appColors.red,
                  fontsize: getFontSize(22, size),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
