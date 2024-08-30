import 'package:attendance/database/konkonsa.dart';
import 'package:attendance/model/loginuser.dart';
import 'package:attendance/model/users.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../const/constants.dart';
import '../const/funcs.dart';
import '../database/auth_functions.dart';
import '../database/error_response.dart';
import '../database/try.dart';
import '../database/user_details_provider.dart';
import '../widget/default_snackbar.dart';
import '../widget/utils/connection_check.dart';
import '../widget/utils/internet_provider.dart';
import '../widget/validator.dart';
import '../widget/widgets.dart';

class StaffSignInScreen extends StatefulWidget {
  const StaffSignInScreen({super.key});

  @override
  State<StaffSignInScreen> createState() => _StaffSignInScreenState();
}

final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
AuthValidate authValidate = AuthValidate();
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController staffidController = TextEditingController();
String username = '';
String password = '';
String staffid = '';

class _StaffSignInScreenState extends State<StaffSignInScreen> {
  final ApiService apiService = ApiService();
  bool _isLoading = false;

  // void _login() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   // var connectivityResult = await (Connectivity().checkConnectivity());
  //   // if (connectivityResult == ConnectivityResult.none) {
  //   //   setState(() {
  //   //     _isLoading = false;
  //   //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //   //       content: Text(
  //   //           'No internet connection. Please check your connection and try again.'),
  //   //     ));
  //   //   });
  //   // }
  //   try {
  //     print(usernameController.text +
  //         passwordController.text +
  //         staffidController.text);
  //     final response = await apiService.login(usernameController.text,
  //         passwordController.text, staffidController.text);
  //     // Handle the response (e.g., navigate to another page, show a success message)
  //     print(response);
  //   } catch (e) {
  //     // Handle error (e.g., show an error message)
  //     print(e.toString());
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: appColors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //createSpace(size, 20, 'vertical'),
                Container(
                  decoration: BoxDecoration(
                    color: appColors.greyDADADA,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: Dimensions().pSH(260),
                  width: Dimensions().pSW(360),
                  // color: appColors.greyDADADA,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
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
                              TextSpan(
                                text:
                                    'You can also access the Student Portal on \n your mobile phone.',
                                style: TextStyle(color: appColors.black),
                              ),
                              TextSpan(
                                text: 'Download App',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
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
                        controller: usernameController,
                        titleText: 'Username',
                        titleColor: appColors.black,
                        textInputType: TextInputType.emailAddress,
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
                        textInputType: TextInputType.name,
                        isPasswordField: true,
                        obsucringText: '*',
                        controller: passwordController,
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
                        titleText: 'Staff ID',
                        titleColor: appColors.black,
                        textInputType: TextInputType.number,
                        controller: staffidController,
                        isPasswordField: true,
                        onchanged: (value) {
                          staffid = value;
                          return;
                        },
                        validator: (value) =>
                            AuthValidate().validateNotEmpty(value),
                        onSaved: (value) {
                          staffidController.text = value;
                        },
                      ),
                    ],
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
                                  await Authentications().loginSTAFF(
                                context: context,
                                username: username,
                                password: password.trim(),
                                staffId: staffid,
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
      ),
    );
  }
}
