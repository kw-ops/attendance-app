import 'package:attendance/model/attend.dart';
import 'package:attendance/model/coursemaodel.dart';
import 'package:attendance/model/loginuser.dart';
import 'package:attendance/model/staff_model.dart';
import 'package:attendance/model/student_model.dart';
// import 'package:attendance/model/student_model.dart';
import 'package:flutter/material.dart';

class UserDetailsProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  LogUs? _user;
  List<CoursesModel> _userAsCourses = [] ;
  StaffModel? _userAsStaff;
  StudentModel? _userAsStudent;
  Attend? _attendMode;
  String? _accessToken;
  int? _courseId ;
  String? _verifyCode = '';

  LogUs getUserDetails() {
    return _user ?? LogUs();
  }

  Attend getAttend() {
    return _attendMode ?? Attend();
  }

   getVerifyCode() {
    return _verifyCode;
  }

   getCourseId() {
    return _courseId;
  }

  List<CoursesModel> getCourseDetails() {
    return _userAsCourses ;
  }

  StaffModel getStaffDetails() {
    return _userAsStaff ?? StaffModel();
  }

  StudentModel getStudentDetails() {
    return _userAsStudent ?? StudentModel();
  }

  void setUserDetails(LogUs user) {
    _user = user;
    notifyListeners();
  }

  void setAttend(Attend attendMode) {
    _attendMode = attendMode;
    notifyListeners();
  }

  void setVerifyCode (String verifyCode) {
    _verifyCode = verifyCode;
    notifyListeners();
  }
  
  void setCourseId (int courseId) {
    _courseId = courseId;
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

  void setStudentDetails(StudentModel userAsStudent) {
    _userAsStudent = userAsStudent;
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
