import 'package:attendance/views/loginsrc/signin.dart';
import 'package:attendance/views/loginsrc/stafflogin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../const/constants.dart';
import '../../const/funcs.dart';
import '../../widget/widgets.dart';

class USerTypeScreen extends StatefulWidget {
  const USerTypeScreen({super.key});

  @override
  State<USerTypeScreen> createState() => _USerTypeScreenState();
}

class _USerTypeScreenState extends State<USerTypeScreen> {
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
            top: Dimensions().pSH(510),
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
            top: Dimensions().pSH(530),
            bottom: Dimensions().pSH(0),
            left: Dimensions().pSW(110),
            right: Dimensions().pSW(110),
            child: SizedBox(
              child: Column(
                children: [
                  Container(
                    height: Dimensions().pSH(70),
                    decoration: BoxDecoration(
                      color: appColors.white,
                      image: DecorationImage(
                        image: AssetImage(studentIcon),
                        fit: BoxFit.none,
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: appColors.black,
                      ),
                    ),
                  ),
                  createSpace(size, 10, 'vertical'),
                  UniversalElevatedAppButton(
                    height: Dimensions().pSH(40),
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ));
                    },
                    text: 'Student',
                    fontsize: getFontSize(13, size),
                    buttonColor: appColors.red,
                    borderRadius: 12,
                  ),
                  createSpace(size, 10, 'vertical'),
                  Container(
                    height: Dimensions().pSH(70),
                    decoration: BoxDecoration(
                      color: appColors.white,
                      image: DecorationImage(
                        image: AssetImage(stuffIcon),
                        fit: BoxFit.none,
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: appColors.black,
                      ),
                    ),
                  ),
                  createSpace(size, 10, 'vertical'),
                  UniversalElevatedAppButton(
                    height: Dimensions().pSH(40),
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StaffSignInScreen(),
                          ));
                    },
                    text: 'Staff',
                    fontsize: getFontSize(13, size),
                    buttonColor: appColors.red,
                    borderRadius: 12,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
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
          ),
        ],
      ),
    );
  }
}
