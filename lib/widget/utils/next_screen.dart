// import 'package:attendance/views/attstudent.dart';
// import 'package:attendance/views/btmStaff.dart';
// import 'package:attendance/views/btmscrstudent.dart';
// import 'package:attendance/views/signin.dart';
// import 'package:attendance/views/splash.dart';
// import 'package:attendance/views/staffattend.dart';
// import 'package:attendance/views/stafflogin.dart';
// import 'package:attendance/views/usertypescreen.dart';
// import 'package:attendance/views/verifyscrstaff.dart';
// import 'package:attendance/views/verifyscrstud.dart';
// import 'package:attendance/views/welcome.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// void nextScreen(context, page) {
//   Navigator.push(context, MaterialPageRoute(builder: (context) => page));
// }

// void nextScreenReplace(context, page) {
//   Navigator.pushReplacement(
//       context, MaterialPageRoute(builder: (context) => page));
// }

// void nextPage(context, page) {
//   MaterialPageRoute(builder: (context) => page);
// }

// final GoRouter router = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/verStaff',
//       name: '/verStaff',
//       builder: (context, state) {
//         return const VerifyStaffScreen();
//       },
//     ),
//     GoRoute(
//       path: '/verStud',
//       name: '/verStud',
//       builder: (context, state) {
//         return const VerificationScreen();
//       },
//     ),
//     GoRoute(
//       path: '/welcome',
//       name: '/welcome',
//       builder: (context, state) {
//         return const WelcomeScreen();
//       },
//     ),
//     GoRoute(
//       path: '/userType',
//       name: '/userType',
//       builder: (context, state) {
//         return const USerTypeScreen();
//       },
//     ),
//     GoRoute(
//       path: '/studentLogin',
//       name: '/studentLogin',
//       builder: (context, state) {
//         return const SignInScreen();
//       },
//     ),
//     GoRoute(
//       path: '/staffLogin',
//       name: '/staffLogin',
//       builder: (context, state) {
//         return const StaffSignInScreen();
//       },
//     ),
//     GoRoute(
//       path: '/staffHome',
//       name: '/staffHome',
//       builder: (context, state) {
//         return const BottomScreenStaff();
//       },
//     ),
//     GoRoute(
//       path: '/studentHome',
//       name: '/studentHome',
//       builder: (context, state) {
//         return const BottomScreenStudent();
//       },
//     ),
//     GoRoute(
//       path: '/',
//       name: '/',
//       builder: (context, state) {
//         return const SplashScreen();
//       },
//     ),
//     // GoRoute(
//     //   path: '/staffAtt',
//     //   name: '/staffAtt',
//     //   builder: (context, state) {
//     //     return const StaffAttendanceScreen();
//     //   },
//     // ),
//     GoRoute(
//       path: '/attStaff/:verCode/:welcomeName/:courseCode/:lecturerName/:courseName/:lecturerPicture',
//       name: '/attStaff',
//       builder: (context, state) {
//         final String verCode = state.pathParameters['verCode']!;
//         final String welcomeName = state.pathParameters['welcomeName']!;
//         final String courseCode = state.pathParameters['courseCode']!;
//         final String lecturerName = state.pathParameters['lecturerName']!;
//         final String courseName = state.pathParameters['courseName']!;
//         final String lecturerPicture = state.pathParameters['lecturerPicture']!;
//         return StaffAttendanceScreen(vercode: verCode,
//          welcomeName: welcomeName,
//           courseCode: courseCode,
//           lecturerName: lecturerName,
//           courseName: courseName,
//           lecturerPicture: lecturerPicture,
//         );
//       },
//     ),
//     GoRoute(
//       path: '/attStud/:verCode/:welcomeName/:courseCode/:lecturerName/:courseName/:lecturerPicture',
//       name: '/attStud',
//       builder: (context, state) {
//         final String verCode = state.pathParameters['verCode']!;
//         final String welcomeName = state.pathParameters['welcomeName']!;
//         final String courseCode = state.pathParameters['courseCode']!;
//         final String lecturerName = state.pathParameters['lecturerName']!;
//         final String courseName = state.pathParameters['courseName']!;
//         final String lecturerPicture = state.pathParameters['lecturerPicture']!;
//         return AttendanceScreenStudent(verCode : verCode,
//          welcomeName: welcomeName,
//           courseCode: courseCode,
//           lecturerName: lecturerName,
//           courseName: courseName,
//           lecturerPicture: lecturerPicture,
//         );
//       },
//     ),
//   ],
// );
