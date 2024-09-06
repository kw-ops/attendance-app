import 'dart:convert';
import 'package:attendance/model/loginuser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../widget/default_snackbar.dart';
import '../widget/utils/internet_provider.dart';
import 'error_response.dart';

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
      final ip = context.read<InternetProvider>();
      ip.checkInternetConnection();

      if (ip.hasInternet == true) {
        final response = await http.post(
          Uri.parse(
              "http://attendacesystem.pythonanywhere.com/api/api/login/staff/"),
          headers: apiHeader,
          body: json.encode({
            "username": username,
            "password": password,
            "staff_id": staffId
          }),
        );
        if (response.statusCode == 200) {
          LogUs user = LogUs.fromJson(jsonDecode(response.body));
          print(user);
          // //Successful login
          print('login successful' + user.toString());
          // showSnackBar(context, 'Login Successful');

          return user;
        } else {
          if (response.statusCode == 400) {
            showSnackBar(context, 'You are not a Staff, See the admin');
          }
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
/// (- Log In User As Student -)///
  Future<dynamic> loginSTUDENT({
    required BuildContext context,
    required String username,
    required String studentId,
    required String password,
  }) async {
    try {
      // bool hasNetWork = await ConnectionCheck().hasConnection();
      final ip = context.read<InternetProvider>();
      ip.checkInternetConnection();

      if (ip.hasInternet == true) {
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
          // showSnackBar(context, 'Login Successful');
          return user;
        } else {
          if (response.statusCode == 400) {
            showSnackBar(context, 'You are not a Student, See the admin');
          }
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
