import 'dart:convert';
import 'package:attendance/model/coursemaodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'user_details_provider.dart';

class KonKonsa {
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
        print('Request failed with status: ${response.statusCode} ${json.decode(response.body)}');
      }
    }
  }

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
}
