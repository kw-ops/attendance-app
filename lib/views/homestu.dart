import 'package:attendance/model/coursemaodel.dart';
import 'package:attendance/model/location.dart';
import 'package:attendance/model/student_model.dart';
import 'package:attendance/views/attstudent.dart';
import 'package:attendance/views/shimmerContainer.dart';
import 'package:attendance/views/verifyscrstud.dart';
import 'package:attendance/widget/avatorwidget.dart';
import 'package:attendance/widget/utils/haptic_utils.dart';
import 'package:attendance/widget/utils/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

import '../const/constants.dart';
import '../const/funcs.dart';
import '../database/konkonsa.dart';
import '../database/user_details_provider.dart';
import '../widget/widgets.dart';

class HomeScreenStudent extends StatefulWidget {
  const HomeScreenStudent({super.key});

  @override
  State<HomeScreenStudent> createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
  final List<CoursesModel> _courseCard = [ ];
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
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final fetchStudent = KonKonsa().getUserDataStudent(context);
    print(fetchStudent);
    if (fetchStudent is StudentModel) {
      if (mounted) {
        Provider.of<UserDetailsProvider>(context).getStudentDetails();
        setState(() {
          isLoading = false;
        });
      } else {
        
      }
    } else {
      
    }
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    return  isLoading ? const ShimmerWidget(child: name()) :
    Scaffold(
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
          itemCount: StudentModel().courses!.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  if ( StudentModel().courses![index].active == true) {
                    // context.goNamed('/attStud');
                    _authenticate();
                    // LocationService()
                    //     .getLocation()
                    //     .then((value) => print(value));
                    LocationService()
                      .determinePosition()
                      .then((value) => print(value));
                  } else {
                    HapticUtils.vibrate();
                  }
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
                            image:StudentModel().courses![index].lecturer![0].profilePicture!,
                            height: Dimensions().pSH(70),
                            width: Dimensions().pSW(70)),
                        AppTextWidget(
                          text: StudentModel().courses![index].toString(),
                          fontsize: getFontSize(24, size),
                          fontWeight: FontWeight.bold,
                        ),
                        Switch(
                          activeColor: appColors.white,
                          activeTrackColor: appColors.green0001,
                          inactiveTrackColor: appColors.red,
                          inactiveThumbColor: appColors.white,
                          value: StudentModel().courses![index].active!,
                          // value: true,
                          onChanged: (val) {
                            setState(
                              () {
                                StudentModel().courses![index].active =
                                    StudentModel().courses![index].active;
                              },
                            );
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
