import 'package:attendance/views/staffattend.dart';
import 'package:attendance/widget/utils/next_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../const/constants.dart';
import '../const/funcs.dart';
import '../widget/inputs/pin_code_textfield_widget.dart';
import '../widget/widgets.dart';

class VerifyStaffScreen extends StatefulWidget {
  const VerifyStaffScreen({super.key});

  @override
  State<VerifyStaffScreen> createState() => _VerifyStaffScreenState();
}

String otpCode = '';
TextEditingController pinCodeController = TextEditingController();

class _VerifyStaffScreenState extends State<VerifyStaffScreen> {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.goNamed('/attStaff', pathParameters: {'verCode':'0'});
              // nextPage(context, const StaffAttendanceScreen(vrcode: ''));
              // context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
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
                controller: pinCodeController,
                shape: PinCodeFieldShape.box,
                fieldHeight: Dimensions().pSH(60),
                fieldWidth: Dimensions().pSW(60),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                borderWidth: 1,
                inactiveBorderWidth: 0.2,
                onDone: (results) {
                  otpCode = results.toString();
                },
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
                  onpressed: () {
                    context.goNamed('/attStaff',
                        pathParameters: {'verCode': otpCode});
                  },
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
