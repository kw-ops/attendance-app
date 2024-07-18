import 'package:attendance/const/funcs.dart';
import 'package:attendance/views/slider.dart';
import 'package:attendance/views/verifyscreen.dart';
import 'package:attendance/widget/app_text_widget.dart';
import 'package:flutter/material.dart';

import '../const/constants.dart';

class AttendanceScreenStudent extends StatefulWidget {
  const AttendanceScreenStudent({super.key});

  @override
  State<AttendanceScreenStudent> createState() =>
      _AttendanceScreenStudentState();
}

class _AttendanceScreenStudentState extends State<AttendanceScreenStudent> {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextWidget(
              text: 'Welcome',
              fontsize: getFontSize(24, size),
              color: appColors.red,
            ),
            AppTextWidget(
              text: 'Kwaku Amanin',
              fontsize: getFontSize(28, size),
            ),
            createSpace(size, 30, 'vertical'),
            AppTextWidget(
              text: 'Today\'s Attendance',
              fontsize: getFontSize(30, size),
            ),
            createSpace(size, 20, 'vertical'),
            Container(
              height: Dimensions().pSH(160),
              width: Dimensions().pSW(340),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: appColors.white,
                boxShadow: [
                  BoxShadow(
                    color: appColors.black0002,
                    offset: const Offset(1, 2),
                    blurRadius: 2,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppTextWidget(
                          text: 'CSM 345',
                          fontsize: getFontSize(24, size),
                          color: appColors.green,
                        ),
                        AppTextWidget(
                          text: 'Dr. K Amissah',
                          fontsize: getFontSize(24, size),
                        )
                      ],
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(pic1),),
                  ],
                ),
              ),
            ),
            createSpace(size, 40, 'vertical'),
            AppTextWidget(
              text: 'text',
              fontsize: getFontSize(24, size),
              color: appColors.black0002,
            ),
            createSpace(size, 5, 'vertical'),
            AppTextWidget(
              text: 'text',
              fontsize: getFontSize(22, size),
              color: appColors.black,
            ),
            createSpace(size, 50, 'vertical'),
            const CustomSliderButton(
              width: 340,
              height: 80,
              routerPage: VerificationScreen(),
              // routerPage: () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => const VerificationScreen()));
              // }),
            ),
          ],
        ),
      ),
    );
  }
}
