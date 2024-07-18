import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../const/constants.dart';
import '../const/funcs.dart';
import '../widget/validator.dart';
import '../widget/widgets.dart';

class StaffSignInScreen extends StatefulWidget {
  const StaffSignInScreen({super.key});

  @override
  State<StaffSignInScreen> createState() => _StaffSignInScreenState();
}

final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
AuthValidate authValidate = AuthValidate();


class _StaffSignInScreenState extends State<StaffSignInScreen> {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appColors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //createSpace(size, 20, 'vertical'),
              Container(
                height: Dimensions().pSH(260),
                width: Dimensions().pSW(360),
                color: appColors.green0001,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: appColors.red,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        //color: appColors.red,
                        height: Dimensions().pSH(115),
                        width: Dimensions().pSW(165),
                        child: Center(
                          child: Image.asset(
                            aim,
                            height: Dimensions().pSH(60),
                            width: Dimensions().pSW(105),
                          ),
                        ),
                      ),
                      createSpace(size, 20, 'vertical'),
                      AppTextWidget(
                        text: 'Acadamic Info Manager',
                        fontWeight: FontWeight.bold,
                        fontsize: getFontSize(20, size),
                        color: appColors.red,
                      ),
                      createSpace(size, 20, 'vertical'),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: getFontSize(14, size),
                          ),
                          children: [
                            const TextSpan(
                              text:
                                  'You can also access the Student Portal on \n your mobile phone.',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: 'Download App',
                              recognizer: TapGestureRecognizer()..onTap = (){},
                              style: TextStyle(
                                color: appColors.red,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              createSpace(size, 50, 'vertical'),
              AppTextWidget(
                text: 'Login',
                fontWeight: FontWeight.bold,
                fontsize: getFontSize(15, size),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppTextField(
                      hintText: 'eg. username',
                      hintTextColor: appColors.black0002,
                      titleText: 'Username',
                      titleColor: appColors.black,
                    ),
                    createSpace(size, 5, 'vertical'),
                    AppTextField(
                      hintText: 'Enter Password',
                      hintTextColor: appColors.black0002,
                      titleText: 'Password',
                      titleColor: appColors.black,
                      isPasswordField: true,
                    ),
                    createSpace(size, 10, 'vertical'),
                    GestureDetector(
                      onTap: () {},
                      child: AppTextWidget(
                        text: 'Forgot Password',
                        fontsize: getFontSize(14, size),
                      ),
                    ),
                    AppTextField(
                      hintText: 'eg. 00000000',
                      hintTextColor: appColors.black0002,
                      titleText: 'Staff ID',
                      titleColor: appColors.black,
                      isPasswordField: true,
                    ),
                  ],
                ),
              ),
              createSpace(size, 20, 'vertical'),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: UniversalElevatedAppButton(
                  onpressed: () {},
                  text: 'Login',
                  height: Dimensions().pSH(40),
                  buttonColor: appColors.green,
                ),
              ),
              createSpace(size, 15, 'vertical'),
              RichText(
                text: TextSpan(
                  text:
                      'You can also access the Student Portal on your mobile ',
                  style: TextStyle(
                    color: appColors.black,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}