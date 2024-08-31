import 'package:attendance/model/loginuser.dart';
import 'package:attendance/model/staff_model.dart';
import 'package:attendance/model/student_model.dart';
import 'package:flutter/material.dart';

class UserDetailsProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  LogUs? _user;
  StudentModel? _userAsStudent;
  StaffModel? _userAsStaff;
  String? _accessToken;

  LogUs getUserDetails() {
    return _user ?? LogUs();
  }
  StudentModel getStudentDetails() {
    return _userAsStudent ?? StudentModel();
  }
  StaffModel getStaffDetails() {
    return _userAsStaff ?? StaffModel();
  }

  void setUserDetails(LogUs user) {
    _user = user;
    notifyListeners();
  }
  void setStudentDetails(StudentModel userAsStudent) {
    _userAsStudent = userAsStudent;
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
