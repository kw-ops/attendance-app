import 'dart:convert';
import 'package:attendance/model/attend.dart';
import 'package:attendance/model/loginuser.dart';
// import 'package:attendance/model/users.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/default_snackbar.dart';
// import '../widget/utils/connection_check.dart';
// import '../widget/utils/internet_provider.dart';
// import 'auth_url.dart';
import 'error_response.dart';
import 'user_details_provider.dart';

const apiHeader = {
  "content-type": "application/json",
  "accept": "application/json",
};

class Authentications {
  /// (- Log In User As Staff -)///
  Future<dynamic> loginSTAFF({
    required BuildContext context,
    required String username,
    required String staffId,
    required String password,
  }) async {
    try {
      // bool hasNetWork = await ConnectionCheck().hasConnection();
      // bool ip = context.read<InternetProvider>().hasInternet;

      // if (ip) {
      final response = await http.post(
        Uri.parse(
            "http://attendacesystem.pythonanywhere.com/api/api/login/staff/"),
        headers: apiHeader,
        body: json.encode(
            {"username": username, "password": password, "staff_id": staffId}),
      );
      if (response.statusCode == 200) {
        LogUs user = LogUs.fromJson(jsonDecode(response.body));
        print(user);
        // //Successful login
        print('login successful' + user.toString());
        showSnackBar(context, 'Login Successful');

        return user;
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

  Future<dynamic> loginSTUDENT({
    required BuildContext context,
    required String username,
    required String studentId,
    required String password,
  }) async {
    try {
      // bool hasNetWork = await ConnectionCheck().hasConnection();
      // final ip = context.read<InternetProvider>().hasInternet;

      // if (ip) {
      final response = await http.post(
        Uri.parse(
            "http://attendacesystem.pythonanywhere.com/api/api/login/student/"),
        headers: apiHeader,
        body: json.encode({
          "student_id": studentId,
          "username": username,
          "password": password,
        }),
      );
      if (response.statusCode == 200) {
        LogUs user = LogUs.fromJson(jsonDecode(response.body));
        // //Successful login
        print('login successful $user');
        showSnackBar(context, 'Unexpected  error, try again');
        return user;
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

  Future<dynamic> takeAttendaceStudent({
    required BuildContext context,
    required String token,
  }) async {
    try {
      // bool hasNetWork = await ConnectionCheck().hasConnection();
      // final ip = context.read<InternetProvider>().hasInternet;
      // String accessToken =
      //     Provider.of<UserDetailsProvider>(context, listen: false)
      //         .getAccessToken();
      int user = Provider.of<UserDetailsProvider>(context, listen: false)
          .getCourseId();

      // if (ip) {
      final response = await http.post(
        Uri.parse(
            "https://attendacesystem.pythonanywhere.com/api/courses/$user/generate_attendance_token/"),
        headers: apiHeader,
        body: json.encode({'token': token}),
      );
      if (response.statusCode == 200) {
        // Attend attuserStud = Attend.fromJson(jsonDecode(response.body));
        // //Successful login
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

  Future<dynamic> takeAttendaceStaff({
    required BuildContext context,
    required String token,
    required String latitude,
    required String longitude,
  }) async {
    try {
      // bool hasNetWork = await ConnectionCheck().hasConnection();
      // final ip = context.read<InternetProvider>().hasInternet;
      // String accessToken =
      //     Provider.of<UserDetailsProvider>(context, listen: false)
      //         .getAccessToken();
      int user = Provider.of<UserDetailsProvider>(context, listen: false)
          .getCourseId();

      // if (ip) {
      final response = await http.post(
        Uri.parse(
            "https://attendacesystem.pythonanywhere.com/api/courses/$user/generate_attendance_token/"),
        headers: apiHeader,
        body: json.encode({
          'token': token,
          'latitude': latitude,
          'longitude': longitude,
        }),
      );
      if (response.statusCode == 200) {
        // Attend attuserStud = Attend.fromJson(jsonDecode(response.body));
        // //Successful login
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
