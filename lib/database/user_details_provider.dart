import 'package:attendance/model/coursemaodel.dart';
import 'package:attendance/model/loginuser.dart';
import 'package:attendance/model/staff_model.dart';
// import 'package:attendance/model/student_model.dart';
import 'package:flutter/material.dart';

class UserDetailsProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  LogUs? _user;
  List<CoursesModel> _userAsCourses = [] ;
  StaffModel? _userAsStaff;
  String? _accessToken;

  LogUs getUserDetails() {
    return _user ?? LogUs();
  }

  List<CoursesModel> getCourseDetails() {
    return _userAsCourses ;
  }

  StaffModel getStaffDetails() {
    return _userAsStaff ?? StaffModel();
  }

  void setUserDetails(LogUs user) {
    _user = user;
    notifyListeners();
  }

  void setCourseDetails(List<CoursesModel> userAsStudent) {
    _userAsCourses = userAsStudent;
    notifyListeners();
  }

  void setStaffDetails(StaffModel userAsStaff) {
    _userAsStaff = userAsStaff;
    notifyListeners();
  }

  ///////////////////////////////////////////////////////////
  /////////////////// Access Token Functions  ///////////////
  String getAccessToken() {
    return _accessToken ?? '';
  }

  void setAccessToken(String token) {
    _accessToken = token;
    notifyListeners();
  }
}
