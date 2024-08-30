import 'package:attendance/model/loginuser.dart';
import 'package:flutter/material.dart';

class UserDetailsProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  LogUs? _user;
  String? _accessToken;

  LogUs getUserDetails() {
    return _user ?? LogUs();
  }

  void setUserDetails(LogUs user) {
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
