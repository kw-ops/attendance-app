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
import 'package:flutter/scheduler.dart';
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

late UserDetailsProvider currentUser;

class _HomeScreenStudentState extends State<HomeScreenStudent> {
  // final List<CoursesModel> _courseCard = [];
  late final LocalAuthentication auth;
  bool isLoading = false;
  bool _supportState = false;

  Future loadpage() async {
    setState(() {
      isLoading = true;
    });
    KonKonsa().getUserDataStudent(context);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    currentUser = context.read<UserDetailsProvider>();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      loadpage();
    });
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState(() {
          _supportState = isSupported;
        }));
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    print(currentUser);
    return isLoading
        ? const ShimmerWidget(child: name())
        : Scaffold(
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
            body: Consumer<UserDetailsProvider>(
              builder: (context, currentUser, child) {
                final courses = currentUser.getCourseDetails();
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: courses.length,
                  itemBuilder: (BuildContext context, int index) {
                    final _course = courses[index];
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: () {
                          if (_course.active == true) {
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
                                    image: _course
                                        .lecturer!
                                        .profilePicture!,
                                    height: Dimensions().pSH(70),
                                    width: Dimensions().pSW(70)),
                                AppTextWidget(
                                  text: _course.name.toString(),
                                  fontsize: getFontSize(24, size),
                                  fontWeight: FontWeight.bold,
                                ),
                                Switch(
                                  activeColor: appColors.white,
                                  activeTrackColor: appColors.green0001,
                                  inactiveTrackColor: appColors.red,
                                  inactiveThumbColor: appColors.white,
                                  value: _course.active!,
                                  // value: true,
                                  onChanged: (val) {
                                    setState(
                                      () {
                                        _course.active =
                                            _course.active;
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
                  },
                );
              },
            ),
          );
  }
  // );
  // throw Exception('Failed to fetch Page ');

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
