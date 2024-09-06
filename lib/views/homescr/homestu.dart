import 'package:attendance/views/attendscr/attstudent.dart';
import 'package:attendance/views/shimmerContainer.dart';
import 'package:attendance/widget/avatorwidget.dart';
import 'package:attendance/widget/default_snackbar.dart';
import 'package:attendance/widget/utils/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import '../../const/constants.dart';
import '../../const/funcs.dart';
import '../../database/konkonsa.dart';
import '../../database/user_details_provider.dart';
import '../../widget/widgets.dart';

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

  String courseName = '';
  String courseCode = '';
  double longitude = 0.0;
  double latitude = 0.0;
  String lecturerName = '';
  String welcomeName = '';
  String lecturerPicture = '';

  Future _loadpage() async {
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
      _loadpage();
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
            body: Column(
              children: [
                AppBar(
                  title: Center(
                    child: AppTextWidget(
                      text: 'COURSE LIST',
                      fontsize: getFontSize(24, size),
                      fontWeight: FontWeight.bold,
                      color: appColors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Consumer<UserDetailsProvider>(
                    builder: (context, currentUser, child) {
                      final courses = currentUser.getCourseDetails();
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: courses.length,
                        itemBuilder: (BuildContext context, int index) {
                          final _course = courses[index];
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () async {
                                // if (_course.active == true) {
                                // context.goNamed('/attStud');
                                print('object tap');
                                _authenticate();
                                // LocationService()
                                //     .getLocation()
                                //     .then((value) => print(value));
                                Provider.of<UserDetailsProvider>(context,
                                        listen: false)
                                    .setCourseId(_course.id!);
                                print(_course.id);
                                LocationService()
                                    .determinePosition()
                                    .then((value) => setState(() {
                                          longitude = value.longitude;
                                          latitude = value.latitude;
                                          print(value);
                                        }));

                                Map<String, double>? coord =
                                    await KonKonsa().getAttendStudent(context);

                                if (coord != null) {
                                  double? locators = await getDistanceBetween(
                                    latitude,
                                    longitude,
                                    coord['latitude'] ?? 0.0,
                                    coord['longitude'] ?? 0.0,
                                  );

                                  if (locators! <= 50) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AttendanceScreenStudent(
                                            // welcomeName: ,
                                            courseCode:
                                                _course.courseCode.toString(),
                                            lecturerName: _course.lecturer!.name
                                                .toString(),
                                            courseName: _course.name.toString(),
                                            lecturerPicture: _course
                                                .lecturer!.profilePicture
                                                .toString(),
                                          ),
                                        ));
                                    print(
                                        'The distance is within the range: ${locators.toStringAsFixed(2)} meters');
                                  } else {
                                    showSnackBar(
                                        context, 'Get Closer to lecture');
                                    print(
                                        'The distance exceeds the range: ${locators.toStringAsFixed(2)} meters');
                                  }
                                }

                                // KonKonsa().getAttendStudent(context);

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
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AvatorWidget(
                                      image: _course.lecturer!.profilePicture!,
                                      height: Dimensions().pSH(70),
                                      width: Dimensions().pSW(70),
                                    ),
                                    SizedBox(
                                      width: Dimensions().pSW(110),
                                      child: AppTextWidget(
                                        text: _course.name.toString(),
                                        textAlign: TextAlign.center,
                                        maxlines: 1,
                                        fontsize: getFontSize(14, size),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Switch(
                                      activeColor: appColors.white,
                                      activeTrackColor: appColors.green0001,
                                      inactiveTrackColor: appColors.red,
                                      inactiveThumbColor: appColors.white,
                                      value: true,
                                      // value: true,
                                      onChanged: (val) {
                                        setState(
                                          () {
                                            _course.active = _course.active;
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
  // );
  // throw Exception('Failed to fetch Page ');

  Future<double>? getDistanceBetween(double startLatitude,
      double startLongitude, double endLatitude, double endLongitude) async {
    try {
      // Calculate the distance between two coordinates
      double distanceInMeters = Geolocator.distanceBetween(
        startLatitude,
        startLongitude,
        endLatitude,
        endLongitude,
      );

      return distanceInMeters;
    } catch (e) {
      print('Error calculating distance: $e');
      return 0.0; // Return 0.0 if there is an error
    }
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
