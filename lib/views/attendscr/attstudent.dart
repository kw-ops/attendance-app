import 'package:attendance/const/funcs.dart';
import 'package:attendance/views/homescr/homestaff.dart';
import 'package:attendance/views/veri/verifyscrstud.dart';
import 'package:attendance/widget/app_text_widget.dart';
import 'package:attendance/widget/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gradient_slide_to_act/gradient_slide_to_act.dart';
import 'package:provider/provider.dart';

import '../../const/constants.dart';
import '../../database/user_details_provider.dart';
import '../../model/loginuser.dart';

class AttendanceScreenStudent extends StatefulWidget {
  const AttendanceScreenStudent({
    super.key,
    // required String welcomeName,
    required String courseCode,
    required String lecturerName,
    required String courseName,
    required String lecturerPicture,
  });

  @override
  State<AttendanceScreenStudent> createState() =>
      _AttendanceScreenStudentState();
}

class _AttendanceScreenStudentState extends State<AttendanceScreenStudent> {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    LogUs welcomeName = Provider.of<UserDetailsProvider>(context, listen: false)
          .getUserDetails();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
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
              text: welcomeName.username!,
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
                          text: courseCode,
                          fontsize: getFontSize(24, size),
                          color: appColors.green,
                        ),
                        AppTextWidget(
                          text: lecturerName,
                          fontsize: getFontSize(24, size),
                        )
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image(image: NetworkImage(lecturerPicture != null ? lecturerPicture : "https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o="),),
                    ),
                  ],
                ),
              ),
            ),
            createSpace(size, 40, 'vertical'),
            AppTextWidget(
              text: TimeOfDay.now().format(context).toString(),
              fontsize: getFontSize(24, size),
              color: appColors.black0002,
            ),
            createSpace(size, 5, 'vertical'),
            AppTextWidget(
              text: DateTime.timestamp().getDate().toString(),
              fontsize: getFontSize(22, size),
              color: appColors.black,
            ),
            createSpace(size, 50, 'vertical'),
            // const CustomSliderButton(
            //   width: 340,
            //   height: 80,
            //   routerPage: '/verStud',
            // ),
            GradientSlideToAct(
              width: 340,
              height: 80,
              textStyle: TextStyle(
                color: appColors.red,
                fontSize: 16,
              ),
              backgroundColor: appColors.white0002,
              onSubmit: () {
                print("Submitted!");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerificationScreen(),
                    ));
              },
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  appColors.red,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
