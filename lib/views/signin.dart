import 'package:attendance/const/funcs.dart';
import 'package:attendance/model/loginuser.dart';
import 'package:attendance/widget/app_text_widget.dart';
import 'package:attendance/widget/inputs/inputs.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../const/constants.dart';
import '../database/auth_functions.dart';
import '../database/user_details_provider.dart';
import '../model/users.dart';
import '../widget/validator.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController studentidController = TextEditingController();
String username = "";
String password = '';
String studentId = '';
AuthValidate authValidate = AuthValidate();
// final ApiService apiService = ApiService();
 
class _SignInScreenState extends State<SignInScreen> {
   bool _isLoading = false;
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
                              recognizer: TapGestureRecognizer()..onTap = () {},
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
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppTextField(
                        hintText: 'eg. username',
                        hintTextColor: appColors.black0002,
                        titleText: 'Username',
                        titleColor: appColors.black,
                        controller: usernameController,
                        onchanged: (value) {
                          username = value;
                          return;
                        },
                        validator: (value) =>
                            AuthValidate().validateusername(value),
                        onSaved: (value) {
                          usernameController.text = value;
                        },
                      ),
                      createSpace(size, 5, 'vertical'),
                      AppTextField(
                        hintText: 'Enter Password',
                        hintTextColor: appColors.black0002,
                        titleText: 'Password',
                        titleColor: appColors.black,
                        isPasswordField: true,
                        controller: passwordController,
                        textInputType: TextInputType.emailAddress,
                        onchanged: (value) {
                          password = value;
                          return;
                        },
                        validator: (value) =>
                            AuthValidate().validateusername(value),
                        onSaved: (value) {
                          passwordController.text = value;
                        },
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
                        titleText: 'Student ID',
                        titleColor: appColors.black,
                        isPasswordField: true,
                        controller: studentidController,
                        textInputType: TextInputType.name,
                        onchanged: (value) {
                          studentId = value;
                          return;
                        },
                        validator: (value) =>
                            AuthValidate().validateNotEmpty(value),
                        onSaved: (value) {
                          studentidController.text = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              createSpace(size, 20, 'vertical'),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: _isLoading
                      ? const CircularProgressIndicator()
                      : UniversalElevatedAppButton(
                          onpressed: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            if (_loginFormKey.currentState!.validate()) {
                              _loginFormKey.currentState!.save();
                              print('object1');
                              // context.goNamed('/staffHome');
                              final loginResponse =
                                  await Authentications().loginSTUDENT(
                                context: context,
                                username: username,
                                password: password.trim(),
                                studentId: studentId,
                              );
                              if (loginResponse is LogUs) {
                                print(loginResponse.token);
                                if (mounted) {
                                  Provider.of<UserDetailsProvider>(context,
                                          listen: false)
                                      .setAccessToken(
                                          loginResponse.token.toString());
                                  // context.goNamed('/staffHome');
                                  print('suc');
                                  Provider.of<UserDetailsProvider>(context,
                                          listen: false)
                                      .setUserDetails(loginResponse);
                                  context.goNamed('/staffHome');
                                  print('suc2');
                                  setState(() {
                                    _isLoading = false;
                                  });
                                } //////////////////////////
                                else {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
                              }
                              print('object2');
                              setState(() {
                                _isLoading = false;
                              });
                            } else {
                              setState(() {
                                _isLoading = false;
                              });
                              print('nullempty');
                            }
                          },
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
