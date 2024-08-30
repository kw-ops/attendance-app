import 'package:attendance/model/coursemaodel.dart';
import 'package:attendance/model/location.dart';
import 'package:attendance/views/attstudent.dart';
import 'package:attendance/views/verifyscrstud.dart';
import 'package:attendance/widget/avatorwidget.dart';
import 'package:attendance/widget/utils/haptic_utils.dart';
import 'package:attendance/widget/utils/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';

import '../const/constants.dart';
import '../const/funcs.dart';
import '../widget/widgets.dart';

class HomeScreenStudent extends StatefulWidget {
  const HomeScreenStudent({super.key});

  @override
  State<HomeScreenStudent> createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
  final List<CoursesModel> _courseCard = [
    // CoursesModel(
    //   image: pic1,
    //   courseCode: 'CSM 467',
    //   attActive: true,
    // ),
    // CoursesModel(
    //   image: pic2,
    //   courseCode: 'CSM 481',
    //   attActive: false,
    // ),
    // CoursesModel(
    //   image: pic3,
    //   courseCode: 'CSM 411',
    //   attActive: false,
    // ),
    // CoursesModel(
    //   image: pic4,
    //   courseCode: 'CSM 247',
    //   attActive: false,
    // ),
    // CoursesModel(
    //   image: pic5,
    //   courseCode: 'CSM 246',
    //   attActive: false,
    // ),
    // CoursesModel(
    //   image: pic6,
    //   courseCode: 'CSM 347',
    //   attActive: false,
    // ),
  ];
  late final LocalAuthentication auth;
  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState(() {
          _supportState = isSupported;
        }));
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: AppTextWidget(
            text: 'COURSE LIST',
            fontsize: getFontSize(24, size),
            fontWeight: FontWeight.bold,
            color: appColors.black,
          ),
        ),
      ),
      body: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _courseCard.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  // if (_courseCard[index].attActive == true) {
                  //   context.goNamed('/attStud');
                  //   _authenticate();
                  //   // LocationService()
                  //   //     .getLocation()
                  //   //     .then((value) => print(value));
                  //   LocationService()
                  //     .determinePosition()
                  //     .then((value) => print(value));
                  // } else {
                  //   HapticUtils.vibrate();
                  // }
                },
                child: Container(
                  height: Dimensions().pSH(70),
                  width: Dimensions().pSW(350),
                  decoration: BoxDecoration(
                    color: appColors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: appColors.black0002,
                        offset: const Offset(1, 3),
                        blurRadius: 2,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0, right: 10, bottom: 0, left: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AvatorWidget(
                            image:" _courseCard[index].image!",
                            height: Dimensions().pSH(70),
                            width: Dimensions().pSW(70)),
                        AppTextWidget(
                          text: _courseCard[index].courseCode!,
                          fontsize: getFontSize(24, size),
                          fontWeight: FontWeight.bold,
                        ),
                        Switch(
                          activeColor: appColors.white,
                          activeTrackColor: appColors.green0001,
                          inactiveTrackColor: appColors.red,
                          inactiveThumbColor: appColors.white,
                          // value: _courseCard[index].attActive!,
                          value: true,
                          onChanged: (val) {
                            // setState(
                            //   () {
                            //     _courseCard[index].attActive =
                            //         _courseCard[index].attActive;
                            //   },
                            // );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'localizedReason',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) {
      return;
    }
  }
}
