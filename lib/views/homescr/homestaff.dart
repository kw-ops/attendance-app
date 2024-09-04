// ignore_for_file: unused_field

import 'package:attendance/database/konkonsa.dart';
import 'package:attendance/model/loginuser.dart';
import 'package:attendance/model/staff_model.dart';
import 'package:attendance/model/users.dart';
import 'package:attendance/views/attendscr/attstudent.dart';
import 'package:attendance/views/shimmerContainer.dart';
import 'package:attendance/views/attendscr/staffattend.dart';
import 'package:attendance/views/veri/verifyscrstaff.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import '../../const/constants.dart';
import '../../const/funcs.dart';
import '../../database/user_details_provider.dart';
import '../../model/coursemaodel.dart';
import '../../widget/utils/location_service.dart';
import '../../widget/widgets.dart';

class HomeStaffScreen extends StatefulWidget {
  const HomeStaffScreen({super.key});

  @override
  State<HomeStaffScreen> createState() => _HomeStaffScreenState();
}

String courseName = '';
String courseCode = '';
double longitude = 0.0;
double latitude = 0.0;
String lecturerName = '';
String welcomeName = '';
String lecturerPicture = '';

late UserDetailsProvider currentUser;

class _HomeStaffScreenState extends State<HomeStaffScreen> {
  final List<StaffModel> staffModel = [];
  late final LocalAuthentication auth;
  bool isLoading = false;
  bool _supportState = false;

  Future loadpage() async {
    setState(() {
      isLoading = true;
    });
    await KonKonsa().getUserDataStaff(context);
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
                          welcomeName = _course.lecturer!.name.toString();
                          courseCode = _course.courseCode.toString();
                          courseName = _course.name.toString();
                          lecturerName = _course.lecturer!.name.toString();
                          lecturerPicture =
                              _course.lecturer!.profilePicture.toString();
                          welcomeName = _course.lecturer!.name.toString();
                          _authenticate;
                          // LocationService().getLocation().then((value) => print(value));
                          Provider.of<UserDetailsProvider>(
                                  context,
                                  listen: false)
                              .setCourseId(_course.id!);
                          LocationService()
                              .determinePosition()
                              .then((value) => 
                              setState(() {
                                longitude = value.longitude;
                                latitude = value.latitude;
                              })
                              );
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StaffAttendanceScreen(
                                  latitude: latitude,
                                  longitude: longitude,
                                    welcomeName: welcomeName,
                                    courseCode: courseCode,
                                    lecturerName: lecturerName,
                                    lecturerPicture: lecturerPicture,
                                    courseName: courseName),
                              ));
                        },
                        child: Container(
                          height: Dimensions().pSH(80),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: appColors.white,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: appColors.black0002.withOpacity(0.5),
                                offset: const Offset(1, 3),
                                blurRadius: 2,
                                spreadRadius: 2,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, right: 20, bottom: 5, left: 20),
                            child: Center(
                              child: AppTextWidget(
                                textAlign: TextAlign.center,
                                text: _course.name.toString(),
                                fontsize: getFontSize(24, size),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
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
