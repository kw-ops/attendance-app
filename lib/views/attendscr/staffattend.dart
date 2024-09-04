import 'package:attendance/database/auth_functions.dart';
import 'package:attendance/database/auth_url.dart';
import 'package:attendance/views/homescr/homestaff.dart';
import 'package:attendance/views/veri/verifyscrstaff.dart';
import 'package:attendance/widget/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradient_slide_to_act/gradient_slide_to_act.dart';
import 'package:provider/provider.dart';
import '../../const/constants.dart';
import '../../const/funcs.dart';
import '../../database/user_details_provider.dart';
import '../../widget/default_snackbar.dart';
import '../../widget/validator.dart';
import '../../widget/widgets.dart';

class StaffAttendanceScreen extends StatefulWidget {
  const StaffAttendanceScreen({
    super.key,
    required String welcomeName,
    required double latitude,
    required double longitude,
    required String courseCode,
    required String lecturerName,
    required String lecturerPicture,
    required String courseName,
  });

  @override
  State<StaffAttendanceScreen> createState() => _StaffAttendanceScreenState();
}

class _StaffAttendanceScreenState extends State<StaffAttendanceScreen> {
  TextEditingController verifyController = TextEditingController();
  String verifyCode = "";
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  // bool isLoading = false;
  // Future loadpage() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   KonKonsa().getUserDataStaff(context);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // void initState() {
  //   super.initState();
  //   currentUser = context.read<UserDetailsProvider>();
  //   SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
  //     loadpage();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    // final verCode = Provider.of<UserDetailsProvider>(context, listen: false)
    //     .getVerifyCode();
    // print(currentUser);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextWidget(
                text: welcomeName,
                fontsize: getFontSize(24, size),
                color: appColors.red,
              ),
              AppTextWidget(
                text: welcomeName,
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
                        // child: Image.network(lecturerPicture,height: 50,width: 50,),
                        child: Image(image: NetworkImage(lecturerPicture),),
                      ),
                    ],
                  ),
                ),
              ),
              createSpace(size, 30, 'vertical'),
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
              createSpace(size, 30, 'vertical'),
              // CustomSliderButton(
              //   width: 340,
              //   height: 80,
              //   isComp: () {
              //     print('ect');
              //     context.pushNamed('/verStaff');
              //   },
              // ),
              GradientSlideToAct(
                width: 340,
                height: 80,
                textStyle: TextStyle(color: appColors.red, fontSize: 15),
                backgroundColor: appColors.white0002,
                onSubmit: () {
                  if (_loginFormKey.currentState!.validate()) {
                    _loginFormKey.currentState!.save();
                    print("Submitted!");
                    Authentications().takeAttendaceStaff(
                      context: context,
                      token: verifyCode,
                      latitude: latitude.toString(),
                      longitude: longitude.toString(),
                    );
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const VerifyStaffScreen(),
                    //     ));
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeStaffScreen(),
                      ),
                    );
                  }
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
              createSpace(size, 15, 'vertical'),
              Center(
                child: Form(
                  key: _loginFormKey,
                  child: AppTextField(
                    hintText: 'Enter OTP Code here',
                    hintTextColor: appColors.black0002,
                    titleText: 'OTP Code',
                    maxlines: 1,
                    titleColor: appColors.black,
                    isPasswordField: true,
                    controller: verifyController,
                    textInputType: TextInputType.name,
                    onchanged: (value) {
                      verifyCode = value;
                      return;
                    },
                    validator: (value) => AuthValidate().validateNotEmpty(value),
                    onSaved: (value) {
                      verifyController.text = value;
                    },
                  ),
                ),
              ),
              createSpace(size, 15, 'vertical'),
              // const CustomSliderButton(
              //   width: 340,
              //   height: 80,
              // ),
              GradientSlideToAct(
                width: 340,
                height: 80,
                textStyle: TextStyle(color: appColors.red, fontSize: 15),
                backgroundColor: appColors.white0002,
                onSubmit: () {
                  print("Submitted!");
                  showSnackBar(context, 'Attendance Ended Successfully');
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return const HomeStaffScreen();
                    },
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
      ),
    );
  }
}
