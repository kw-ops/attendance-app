import 'package:attendance/const/constants.dart';
import 'package:attendance/const/funcs.dart';
import 'package:attendance/views/startupscr/usertypescreen.dart';
import 'package:attendance/widget/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appColors.red,
      body: Stack(
        //clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            top: Dimensions().pSH(650),
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: appColors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              //color: appColors.white,
              height: Dimensions().pSH(140),
            ),
          ),
          Positioned(
            top: Dimensions().pSH(665),
            bottom: Dimensions().pSH(0),
            left: Dimensions().pSW(110),
            right: Dimensions().pSW(110),
            child: SizedBox(
              child: Column(
                children: [
                  UniversalElevatedAppButton(
                    height: Dimensions().pSH(40),
                    onpressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => USerTypeScreen(),));
                    },
                    text: 'Tap to Log In',
                    fontsize: getFontSize(13, size),
                    buttonColor: appColors.red,
                    borderRadius: 12,
                  ),
                  createSpace(size, 10, 'vertical'),
                  UniversalOutlineAppButton(
                    height: Dimensions().pSH(40),
                    onpressed: () {},
                    text: 'Forget Paasword',
                    fontsize: getFontSize(13, size),
                    borderColor: appColors.red,
                    textButtonColor: appColors.red,
                    borderRadius: 12,
                  ),
                  createSpace(size, 10, 'vertical'),
                  GestureDetector(
                    onTap: () {},
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: getFontSize(14, size),
                        ),
                        children: [
                          TextSpan(
                            text: 'Need help?',
                            style: TextStyle(
                              color: appColors.red,
                            ),
                          ),
                          TextSpan(
                            text: ' Tap here',
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            style: TextStyle(
                              color: appColors.red,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          // AppTextWidget(
                          //   color: appColors.red,
                          //   fontsize: getFontSize(13, size),
                          //   text: 'Need help? Tap here',
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   top: Dimensions().pSH(685),
          //   bottom: Dimensions().pSH(800),
          //   left: Dimensions().pSW(110),
          //   right: Dimensions().pSW(110),
          //   child: UniversalElevatedAppButton(
          //     onpressed: () {},
          //     text: 'to Log In',
          //     fontsize: getFontSize(13, size),
          //     buttonColor: appColors.red,
          //     borderRadius: 12,
          //   ),
          // ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: Dimensions().pSH(90),
                    width: Dimensions().pSW(300),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          knust,
                          height: Dimensions().pSH(75),
                          width: Dimensions().pSW(45),
                        ),
                        createSpace(size, 5, 'horizontal'),
                        const VerticalDivider(
                          thickness: 3,
                        ),
                        createSpace(size, 5, 'horizontal'),
                        Image.asset(
                          aim,
                          height: Dimensions().pSH(75),
                          width: Dimensions().pSW(140),
                        ),
                      ],
                    ),
                  ),
                ),
                createSpace(size, 20, 'vertical'),
                AppTextWidget(
                  text: 'Academic Info Manager',
                  fontsize: getFontSize(20, size),
                  color: appColors.white,
                  fontWeight: FontWeight.bold,
                ),
                createSpace(size, 15, 'vertical'),
                AppTextWidget(
                  text: 'Official mobile app for KNUST Student',
                  fontsize: getFontSize(13, size),
                  color: appColors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
