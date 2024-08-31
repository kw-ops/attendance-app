import 'dart:convert';
// import 'dart:math';
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
  Future<dynamic> getUserDataStudent(BuildContext context) async {
    if (context.mounted) {
      LogUs user = Provider.of<UserDetailsProvider>(context, listen: false)
          .getUserDetails();
      String accessToken =
          Provider.of<UserDetailsProvider>(context, listen: false)
              .getAccessToken();
              print('object${accessToken}');
      print('object${user.id}');
      final response = await http.get(
          Uri.parse(
              "http://attendacesystem.pythonanywhere.com/api/students/my-courses/?id=${user.id.toString()}"),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            "Authorization": "Bearer $accessToken"
          });

      if (response.statusCode == 200) {
        // Process the response
        StudentModel userAsStudent =
            StudentModel.fromJson(jsonDecode(response.body));
        print('Response data: ${userAsStudent}');
        return userAsStudent;
      } else {
        // Handle the error
        print('Request failed with status: ${response.statusCode}');
      }
    }
  }

  Future<dynamic> getUserDataStaff(BuildContext context) async {
    if (context.mounted) {
      LogUs user = Provider.of<UserDetailsProvider>(context, listen: false)
          .getUserDetails();
      String accessToken =
          Provider.of<UserDetailsProvider>(context, listen: false)
              .getAccessToken();
      print('object${accessToken}');
      print('object${user.id}');
      final response = await http.get(
          Uri.parse(
              "http://attendacesystem.pythonanywhere.com/api/lecturers/${user.id.toString()}/"),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            "Authorization": "Token $accessToken"
          });

      if (response.statusCode == 200) {
        // Process the response
        StaffModel userAsStaff = StaffModel.fromJson(jsonDecode(response.body));
        print('Response data: ${userAsStaff}');
        return userAsStaff;
      } else {
        // Handle the error
        print('Request failed with status: ${response.statusCode}');
      }
    }
  }

//   bool isLoading = true;
//   String error = '';
//   List<StudentModel> studentModel = [];

//   Future<List<StudentModel>> getstudentData() async {
//     try {
//       Response response =
//           await http.get(Uri.parse(AuthUrl.students), headers: apiHeader);
//       if (response.statusCode == 200) {
//         studentModel = StudentModel.fromJson(json.decode(response.body))
//             as List<StudentModel>;
//       } else {
//         error = response.statusCode.toString();
//       }
//     } catch (e) {
//       error = e.toString();
//     }
//     isLoading = false;
//     notifyListeners;
//     return studentModel;
//   }

// //   Future signInStaff() async {
// //     try {
// //       Response response =
// //           await http.post(Uri.parse(AuthUrl.loginStaff), headers: apiHeader);
// //       if (response.statusCode == 200) {
// //         studentModel = StudentModel.fromJson(json.decode(response.body))
// //             as List<StudentModel>;
// //       } else {
// //         error = response.statusCode.toString();
// //       }
// //     } catch (e) {
// //       error = e.toString();
// //     }
// //     isLoading = false;
// //     notifyListeners;
// //   }
// // }

//   Future<LogUs> signInStudent(String username, String password) async {
//     Map<String, dynamic> request = {
//       'username': username,
//       'password': password,
//     };
//     final uri = Uri.parse(AuthUrl.loginStud);
//     final response = await http.post(uri, body: request);
//     if (response.statusCode == 201) {
//       return LogUs.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load post');
//     }
//   }

//   Future<LogUs?> signInStaff(String username, String password) async {
//     Map<String, dynamic> request = {
//       'username': username,
//       'password': password,
//     };
//     try {
//       final uri = Uri.parse(
//           'https://attendance-systen-6a30.onrender.com/api/login/staff/');
//       final response = await http.post(uri, headers: apiHeader,body: jsonEncode(request));
//       if (response.statusCode == 200) {
//        print('Response: ${response.body}');
//        return LogUs.fromJson(json.decode(response.body));
//       }
//       else {
//        print('Failed with status: ${response.statusCode}');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
}
