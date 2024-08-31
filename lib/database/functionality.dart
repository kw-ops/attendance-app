import 'dart:convert';

import 'package:attendance/database/auth_url.dart';
import 'package:attendance/model/loginuser.dart';
// import 'package:attendance/model/users.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
// import '../widget/default_snackbar.dart';
// import '../widget/utils/connection_check.dart';
import '../widget/utils/internet_provider.dart';
import 'error_response.dart';
import 'http_response_model.dart';
import 'user_details_provider.dart';

class AttendanceFunctionalityStaff{
  Future fetchStudents(
      {required BuildContext context, required String students}) async {
    // final hasConnection = context.read<InternetProvider>().hasInternet;
    // if (hasConnection) {
      if (context.mounted) {
        final String accessToken =
            Provider.of<UserDetailsProvider>(context, listen: false)
                .getAccessToken();

        final response = await http.get(
          Uri.parse(students.isNotEmpty ? students : AuthUrl.students),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            "Authorization": "Bearer $accessToken"
          },
        );
        if (response.statusCode == 200) {
          print("Response ${response.body}");
          return HttpResponseModel.fromJson(jsonDecode(response.body));
        } else {
          print("Error ${response.body}");

          return ErrorResponse.fromJson(jsonDecode(response.body));
        }
      }
    // } else {
    //   //print('error');
    //   if (context.mounted) {
    //     showSnackBar(context, 'No internet connection');
    //   }
    //   return null;
    // }
  }
  Future fetchStaff(
      {required BuildContext context, required String staff}) async {
    // final hasConnection = context.read<InternetProvider>().hasInternet;
    // if (hasConnection) {
      if (context.mounted) {
        final String accessToken =
            Provider.of<UserDetailsProvider>(context, listen: false)
                .getAccessToken();

        final response = await http.get(
          Uri.parse(staff.isNotEmpty ? staff : AuthUrl.lecturers),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            "Authorization": "Bearer $accessToken"
          },
        );
        if (response.statusCode == 200) {
          print("Response ${response.body}");
          return HttpResponseModel.fromJson(jsonDecode(response.body));
        } else {
          print("Error ${response.body}");

          return ErrorResponse.fromJson(jsonDecode(response.body));
        }
      }
    // } else {
    //   //print('error');
    //   if (context.mounted) {
    //     showSnackBar(context, 'No internet connection');
    //   }
    //   return null;
    // }
  }

   Future takeAttendance(
      {required BuildContext context,
      required int fiftyFifty,
      required int goldenBadges}) async {
    final hasConnection = context.read<InternetProvider>().hasInternet;

    if (hasConnection) {
      if (context.mounted) {
        LogUs user = Provider.of<UserDetailsProvider>(context, listen: false)
            .getUserDetails();
        // String accessToken =
        //     Provider.of<UserDetailsProvider>(context, listen: false)
        //         .getAccessToken();

        final response = await http.patch(
          Uri.parse('${AuthUrl.attendanceTokens}${user.id}/update-game-streaks/'),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            // "Authorization": "Bearer $accessToken"
          },
          body: jsonEncode(
            {
              'fifty_fitfy_points': fiftyFifty,
              'golden_badges': goldenBadges,
            },
          ),
        );
        if (response.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      }
    } else {
      return null;
    }
  }

  // Future takeAttendance({required BuildContext context}) async {
  //   final hasConnection = await ConnectionCheck().hasConnection();
  //   if (hasConnection) {
  //     if (context.mounted) {
  //       final String accessToken =
  //           Provider.of<UserDetailsProvider>(context, listen: false)
  //               .getAccessToken();

  //       final response = await http.post(Uri.parse(AuthUrl.attendanceTokens),
  //           headers: {
  //             "content-type": "application/json",
  //             "accept": "application/json",
  //             "Authorization": "Bearer $accessToken"
  //           },
  //           body: jsonEncode({}));
  //       if (response.statusCode == 201) {
  //         print("Response ${response.body}");
  //         return HttpResponseModel.fromJson(jsonDecode(response.body));
  //       } else {
  //         print("Error ${response.body}");
  //         if (context.mounted) {
  //           showSnackBar(context, 'Failed to load games');
  //         }
  //         return ErrorResponse.fromJson(jsonDecode(response.body));
  //       }
  //     }
  //   } else {
  //     print('error');
  //     if (context.mounted) {
  //       showSnackBar(context, 'No internet connection');
  //     }
  //     return null;
  //   }
  // }

}