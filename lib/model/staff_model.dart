import 'package:attendance/model/coursemaodel.dart';
import 'package:attendance/model/loginuser.dart';
// import 'package:attendance/model/user.dart';

class StaffModel {
  int? id;
  String? name;
  String? profilePicture;
  List<dynamic>? courses;
  LogUs? user;

  StaffModel({
    this.id,
    this.name,
    this.profilePicture,
    this.courses,
    this.user,
  });

  StaffModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePicture = json['profile_picture'];
    // attActive = json['date_time'];
    courses = json['courses'];
    user = LogUs.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['profile_picture'] = profilePicture;
    // data['date_time'] = attActive;
    data['courses'] = courses;
    data['user'] = user;
    return data;
  }
}
