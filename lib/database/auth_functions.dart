import 'dart:convert';
import 'package:attendance/model/loginuser.dart';
import 'package:attendance/model/users.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../widget/default_snackbar.dart';
import '../widget/utils/connection_check.dart';
import '../widget/utils/internet_provider.dart';
import 'auth_url.dart';
import 'error_response.dart';

const apiHeader = {
  "content-type": "application/json",
  "accept": "application/json",
};

class Authentications {
  //////////////////////////////////////////////////////
  //////////////(- Log In User -)//////////////////////
  Future<dynamic> loginSTAFF({
    required BuildContext context,
    required String username,
    required String staffId,
    required String password,
    // required bool keepLoggedIn
  }) async {
    try {
      // bool hasNetWork = await ConnectionCheck().hasConnection();
      // bool ip = context.read<InternetProvider>().hasInternet;

      // if (ip) {
        final response = await http.post(
          Uri.parse(AuthUrl.loginStaff),
          headers: apiHeader,
          body: json.encode({
            // "email": email,
            "username": username,
            "password": password,
            "staff_id": staffId
          }),
        );
        if (response.statusCode == 201) {
          LogUs user = LogUs.fromJson(jsonDecode(response.body));
          // //Successful login
          // userSecureStorage(
          //     user, keepLoggedIn, json.decode(response.body)['user']);
          // //
          // if (context.mounted) {
          //   GameFunction().getGameStreaks(context: context);
          // }
          print('login successful' + user.toString());

          return;
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
    // required bool keepLoggedIn
  }) async {
    try {
      // bool hasNetWork = await ConnectionCheck().hasConnection();
      final ip = context.read<InternetProvider>().hasInternet;

      if (ip) {
        final response = await http.post(
          Uri.parse(AuthUrl.loginStud),
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
          // userSecureStorage(
          //     user, keepLoggedIn, json.decode(response.body)['user']);
          // //
          // if (context.mounted) {
          //   GameFunction().getGameStreaks(context: context);
          // }
          print('login successful $user');
          return;
        } else {
          return ErrorResponse.fromJson(json.decode(response.body));
        }
      } else {
        if (context.mounted) {
          showSnackBar(context, 'No internet connection');
        }
        return 900;
      }
    } catch (e) {
      showSnackBar(context, 'Unexpected  error, try again');
      return 700;
    }
  }
}