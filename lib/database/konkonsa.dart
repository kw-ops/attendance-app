import 'dart:convert';
import 'package:attendance/model/attendhistory.dart';
import 'package:attendance/model/coursemaodel.dart';
import 'package:attendance/model/loginuser.dart';
import 'package:attendance/model/staff_model.dart';
import 'package:attendance/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../widget/default_snackbar.dart';
import 'error_response.dart';
import 'user_details_provider.dart';

class KonKonsa {

  /// (- Get In User Details As Student -)///
  // ignore: body_might_complete_normally_nullable
  Future<List<CoursesModel>?> getUserDataStudent(BuildContext context) async {
    if (context.mounted) {
      String accessToken =
          Provider.of<UserDetailsProvider>(context, listen: false)
              .getAccessToken();
      debugPrint('object ${accessToken}');
      final response = await http.get(
          Uri.parse(
              "https://attendacesystem.pythonanywhere.com/api/api/studentenrolledcourses/"),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            "Authorization": "Token $accessToken"
          });

      if (response.statusCode == 200) {
        // Process the response
        List<dynamic> data = json.decode(response.body);
        print(data);
        //
        final userAsCourse =
            data.map((json) => CoursesModel.fromJson(json)).toList();
        Provider.of<UserDetailsProvider>(context, listen: false)
            .setCourseDetails(userAsCourse);
        return userAsCourse;
      } else {
        // Handle the error
        print(
            'Request failed with status: ${response.statusCode} ${json.decode(response.body)}');
      }
    }
  }

  Future<List<HistoryAttendance>?> getUserAttendanceStudent(
      BuildContext context) async {
    if (context.mounted) {
      String accessToken =
          Provider.of<UserDetailsProvider>(context, listen: false)
              .getAccessToken();
      debugPrint('object ${accessToken}');
      final response = await http.get(
          Uri.parse(
              "https://attendacesystem.pythonanywhere.com/api/api/student-attendance-history/"),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            "Authorization": "Token $accessToken"
          });

      if (response.statusCode == 200) {
        // Process the response
        List<dynamic> data = json.decode(response.body);
        print(data);
        //
        final userAsCourse =
            data.map((json) => HistoryAttendance.fromJson(json)).toList();
        Provider.of<UserDetailsProvider>(context, listen: false)
            .setAttendanceDetails(userAsCourse);
        return userAsCourse;
      } else {
        // Handle the error
        print(
            'Request failed with status: ${response.statusCode} ${json.decode(response.body)}');
      }
    }
  }

  /// (- Get In User Attendance As Staff -)///
  Future<List<HistoryAttendance>?> getUserAttendanceStaff(
      BuildContext context) async {
    if (context.mounted) {
      String accessToken =
          Provider.of<UserDetailsProvider>(context, listen: false)
              .getAccessToken();
      debugPrint('object ${accessToken}');
      final response = await http.get(
          Uri.parse(
              "https://attendacesystem.pythonanywhere.com/api/api/lecturer-attendance-history/"),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            "Authorization": "Token $accessToken"
          });

      if (response.statusCode == 200) {
        // Process the response
        List<dynamic> data = json.decode(response.body);
        print(data);
        //
        final userAsCourse =
            data.map((json) => HistoryAttendance.fromJson(json)).toList();
        Provider.of<UserDetailsProvider>(context, listen: false)
            .setAttendanceDetails(userAsCourse);
        return userAsCourse;
      } else {
        // Handle the error
        print(
            'Request failed with status: ${response.statusCode} ${json.decode(response.body)}');
      }
    }
  }

  /// (- Get In User Details As Staff -)///
  // ignore: body_might_complete_normally_nullable
  Future<List<CoursesModel>?> getUserDataStaff(BuildContext context) async {
    if (context.mounted) {
      String accessToken =
          Provider.of<UserDetailsProvider>(context, listen: false)
              .getAccessToken();
      // ignore: avoid_print
      print('object${accessToken}');
      final response = await http.get(
          Uri.parse(
              "http://attendacesystem.pythonanywhere.com/api/lecturers/my-courses/"),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            "Authorization": "Token $accessToken"
          });

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        print(data);
        //
        final userAsCourse =
            data.map((json) => CoursesModel.fromJson(json)).toList();
        Provider.of<UserDetailsProvider>(context, listen: false)
            .setCourseDetails(userAsCourse);
        return userAsCourse;
        // return data.map((json) => CoursesModel.fromJson(json)).toList();
      } else {
        // Handle the error
        print('Request failed with status: ${response.statusCode}');
      }
    }
  }

  Future<dynamic> getUserStaff(BuildContext context) async {
    if (context.mounted) {
      String accessToken =
          Provider.of<UserDetailsProvider>(context, listen: false)
              .getAccessToken();
      LogUs user = Provider.of<UserDetailsProvider>(context, listen: false)
          .getUserDetails();
      // ignore: avoid_print
      print('object${accessToken}');
      final response = await http.get(
          Uri.parse(
              "https://attendacesystem.pythonanywhere.com/api/lecturers/${user.id}/"),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            "Authorization": "Token $accessToken"
          });

      if (response.statusCode == 200) {
        StaffModel user = StaffModel.fromJson(jsonDecode(response.body));
        Provider.of<UserDetailsProvider>(context, listen: false)
            .setStaffDetails(user);
        print(user);
        // //Successful login
        print('login successful' + user.toString());
        // showSnackBar(context, 'Login Successful');

        return user;
      } else {
        // return ErrorResponse.fromJson(json.decode(response.body));
      }
    }
  }

  Future<dynamic> getUserStudent(BuildContext context) async {
    if (context.mounted) {
      String accessToken =
          Provider.of<UserDetailsProvider>(context, listen: false)
              .getAccessToken();
      LogUs user = Provider.of<UserDetailsProvider>(context, listen: false)
          .getUserDetails();
      // ignore: avoid_print
      print('object${accessToken}');
      final response = await http.get(
          Uri.parse(
              "https://attendacesystem.pythonanywhere.com/api/students/${user.id}/"),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            "Authorization": "Token $accessToken"
          });

      if (response.statusCode == 200) {
        StudentModel user = StudentModel.fromJson(jsonDecode(response.body));
        Provider.of<UserDetailsProvider>(context, listen: false)
            .setStudentDetails(user);
        print(user);
        // //Successful login
        print('login successful' + user.toString());
        // showSnackBar(context, 'Login Successful');

        return user;
      } else {
        // return ErrorResponse.fromJson(json.decode(response.body));
      }

      // if (response.statusCode == 200) {
      //   Staff data = json.decode(response.body);
      //   print(data);
      //   //
      //   final userAsCourse =
      //       data.map((json) => CoursesModel.fromJson(json)).toList();
      //   Provider.of<UserDetailsProvider>(context, listen: false)
      //       .setCourseDetails(userAsCourse);
      //   return userAsCourse;
      //   // return data.map((json) => CoursesModel.fromJson(json)).toList();
      // } else {
      //   // Handle the error
      //   print('Request failed with status: ${response.statusCode}');
      // }
    }
  }

  // Future<List<CoursesModel>?> getAttehdStaff(BuildContext context) async {
  //   if (context.mounted) {
  //     String accessToken =
  //         Provider.of<UserDetailsProvider>(context, listen: false)
  //             .getAccessToken();
  //     // ignore: avoid_print
  //     print('object${accessToken}');
  //     final response = await http.get(
  //         Uri.parse(
  //             "http://attendacesystem.pythonanywhere.com/api/lecturers/my-courses/"),
  //         headers: {
  //           "content-type": "application/json",
  //           "accept": "application/json",
  //           "Authorization": "Token $accessToken"
  //         });

  //     if (response.statusCode == 200) {
  //       List<dynamic> data = json.decode(response.body);
  //       print(data);
  //       //
  //       final userAsCourse =
  //           data.map((json) => CoursesModel.fromJson(json)).toList();
  //       Provider.of<UserDetailsProvider>(context, listen: false)
  //           .setCourseDetails(userAsCourse);
  //       return userAsCourse;
  //       // return data.map((json) => CoursesModel.fromJson(json)).toList();
  //     } else {
  //       // Handle the error
  //       print('Request failed with status: ${response.statusCode}');
  //     }
  //   }
  // }

  /// (- Get In Location Details As Student -)///
  Future<Map<String, double>?> getAttendStudent(BuildContext context) async {
    if (context.mounted) {
      String accessToken =
          Provider.of<UserDetailsProvider>(context, listen: false)
              .getAccessToken();
      int user = Provider.of<UserDetailsProvider>(context, listen: false)
          .getCourseId();
      // ignore: avoid_print
      print('object${accessToken}');
      final response = await http.get(
          Uri.parse(
              "https://attendacesystem.pythonanywhere.com/api/api/lecturer-location/$user"),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            "Authorization": "Token $accessToken"
          });

      if (response.statusCode == 200) {
        // Decode the JSON response
        final jsonResponse = json.decode(response.body);
        print(response.body);
        // Extract specific attributes
        final double longitude = jsonResponse['longitude'];
        final double latitude = jsonResponse['latitude'];

        // Return the extracted attributes in a Map

        Map<String, double> cordinate = {
          "longitude": longitude,
          "latitude": latitude,
        };

        return cordinate;
      } else {
        // Handle the error
        print('Request failed with status: ${response.statusCode}');
      }
    }
  }

  /// (- End In Attendance As Student -)///
  Future<dynamic> takeAttendaceStudent({
    required BuildContext context,
    required String token,
  }) async {
    try {
      // bool hasNetWork = await ConnectionCheck().hasConnection();
      // final ip = context.read<InternetProvider>().hasInternet;
      String accessToken =
          Provider.of<UserDetailsProvider>(context, listen: false)
              .getAccessToken();
      // int user = Provider.of<UserDetailsProvider>(context, listen: false)
      //     .getCourseId();

      // if (ip) {
      final response = await http.post(
        Uri.parse(
            "https://attendacesystem.pythonanywhere.com/api/courses/take_attendance/"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Authorization": "Token $accessToken"
        },
        body: json.encode({'token': token}),
      );
      if (response.statusCode == 200) {
        // Attend attuserStud = Attend.fromJson(jsonDecode(response.body));
        // //Successful login
        showSnackBar(context, 'Attendance Successfully Taken');
        print('login successful ${response.statusCode}');
        return 200;
        // return attuserStud;
      } else if (response.body == 404) {
        showSnackBar(context, 'Attendance Taken Failed!');
        return 404;
      } else {
        return ErrorResponse.fromJson(json.decode(response.body));
      }
      // } else {
      //   if (context.mounted) {
      //     showSnackBar(context, 'No internet connection');
      //   }
      //   return 900;
      // }
    } catch (e) {
      showSnackBar(context, 'Unexpected  error, try again');
      return 700;
    }
  }

  /// (- send In Staff location to Student -)///
  Future<dynamic> takeAttendaceStaff({
    required BuildContext context,
    required String token,
    required double latitude,
    required double longitude,
  }) async {
    try {
      // bool hasNetWork = await ConnectionCheck().hasConnection();
      // final ip = context.read<InternetProvider>().hasInternet;
      String accessToken =
          Provider.of<UserDetailsProvider>(context, listen: false)
              .getAccessToken();
      int user = Provider.of<UserDetailsProvider>(context, listen: false)
          .getCourseId();

      // if (ip) {
      final response = await http.post(
        Uri.parse(
            "https://attendacesystem.pythonanywhere.com/api/courses/$user/generate_attendance_token/"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Authorization": "Token $accessToken"
        },
        body: json.encode({
          'token': token,
          'latitude': latitude,
          'longitude': longitude,
        }),
      );
      if (response.statusCode == 200) {
        // Attend attuserStud = Attend.fromJson(jsonDecode(response.body));
        // //Successful login
        showSnackBar(context, 'Attendance Successfully Started');
        print('login successful ${response.statusCode}');
        print('login successful ${response.body}');
        // return attuserStud;
      } else {
        return ErrorResponse.fromJson(json.decode(response.body));
      }
      // } else {
      //   if (context.mounted) {
      //     showSnackBar(context, 'No internet connection');
      //   }
      //   return 900;
      // }
    } catch (e) {
      showSnackBar(context, 'Unexpected  error, try again');
      return 700;
    }
  }


  /// (- End In User Details As Staff -)///
  Future<dynamic> endAttendanceStaff({
    required BuildContext context,
    required int token,
  }) async {
    try {
      // bool hasNetWork = await ConnectionCheck().hasConnection();
      // final ip = context.read<InternetProvider>().hasInternet;
      String accessToken =
          Provider.of<UserDetailsProvider>(context, listen: false)
              .getAccessToken();
      int user = Provider.of<UserDetailsProvider>(context, listen: false)
          .getCourseId();

      // if (ip) {
      final response = await http.post(
        Uri.parse(
            "https://attendacesystem.pythonanywhere.com/api/attendances/end_attendance/"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          "Authorization": "Token $accessToken"
        },
        body: json.encode({'token': user}),
      );
      if (response.statusCode == 200) {
        // Attend attuserStud = Attend.fromJson(jsonDecode(response.body));
        // //Successful login
        showSnackBar(context, 'Attendance Successfully Taken');
        print('login successful ${response.statusCode}');
        // return attuserStud;
      } else {
        return ErrorResponse.fromJson(json.decode(response.body));
      }
      // } else {
      //   if (context.mounted) {
      //     showSnackBar(context, 'No internet connection');
      //   }
      //   return 900;
      // }
    } catch (e) {
      showSnackBar(context, 'Unexpected  error, try again');
      return 700;
    }
  }
}
