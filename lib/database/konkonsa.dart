import 'dart:convert';
// import 'dart:math';
import 'package:attendance/model/coursemaodel.dart';
import 'package:attendance/model/loginuser.dart';
import 'package:attendance/model/staff_model.dart';
import 'package:attendance/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
import 'package:provider/provider.dart';

// import 'auth_url.dart';
import 'user_details_provider.dart';

// const apiHeader = {
//   "content-type": "application/json",
//   "accept": "application/json",
// };

class KonKonsa {
  Future<List<CoursesModel>?> getUserDataStudent(BuildContext context) async {
    if (context.mounted) {
      // LogUs user = Provider.of<UserDetailsProvider>(context, listen: false)
      //     .getUserDetails();
      String accessToken =
          Provider.of<UserDetailsProvider>(context, listen: false)
              .getAccessToken();
      print('object${accessToken}');
      // print('object${user.id}');
      final response = await http.get(
          Uri.parse(
              "http://attendacesystem.pythonanywhere.com/api/api/student-enrolled-courses/"),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            "Authorization": "Bearer $accessToken"
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
        print('Request failed with status: ${response.statusCode}');
      }
    }
  }

  Future<List<CoursesModel>?> getUserDataStaff(BuildContext context) async {
    if (context.mounted) {
      String accessToken =
          Provider.of<UserDetailsProvider>(context, listen: false)
              .getAccessToken();
      print('object${accessToken}');
      final response = await http.get(
          Uri.parse(
              "http://attendacesystem.pythonanywhere.com/api/lecturers/my-courses/"),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            "Authorization": "Bearer $accessToken"
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
}
