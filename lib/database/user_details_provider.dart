import 'package:attendance/model/loginuser.dart';
import 'package:attendance/model/users.dart';
import 'package:flutter/material.dart';

class UserDetailsProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  LogUs? _logUs;
  Users? _user;
  String? _accessToken;
  int? id;

  LogUs getLoginDetails() {
    return _logUs ?? LogUs();
  }
  Users getUserDetails() {
    return _user ?? Users(id: id);
  }

  void setLoginDetails(LogUs logUs) {
    _logUs = logUs;
    notifyListeners();
  }
  void setUserDetails(Users user) {
    _user = user;
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
