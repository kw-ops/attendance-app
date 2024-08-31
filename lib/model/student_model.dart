import 'package:attendance/model/coursemaodel.dart';
import 'package:attendance/model/loginuser.dart';
// import 'package:attendance/model/users.dart';

class StudentModel {
  int? id;
  String? name;
  String? profilePicture;
  List<CoursesModel>? courses;
  List<LogUs>? users;

  StudentModel({
    this.id,
    this.name,
    this.profilePicture,
    this.courses,
    this.users,
  });

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePicture = json['profile_picture'];
    // attActive = json['date_time'];
    courses = ((json['courses']) as List)
        .map((e) => CoursesModel.fromJson(e))
        .toList();
    users = ((json['users']) as List).map((e) => LogUs.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['profile_picture'] = profilePicture;
    // data['date_time'] = attActive;
    data['courses'] = courses;
    data['users'] = users;
    return data;
  }
}
