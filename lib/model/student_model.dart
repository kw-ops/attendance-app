import 'package:attendance/model/loginuser.dart';

class StudentModel {
  int? id;
  String? name;
  String? studentId;
  String? programmeOfStudy;
  String? phoneNumber;
  String? year;
  String? profilePicture;
  List<dynamic>? courses;
  LogUs? user;

  StudentModel({
    this.id,
    this.phoneNumber,
    this.name,
    this.studentId,
    this.programmeOfStudy,
    this.year,
    this.profilePicture,
    this.courses,
    this.user,
  });

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    studentId = json['student_id'];
    programmeOfStudy = json['programme_of_study'];
    phoneNumber = json['phone_number'];
    year = json['year'];
    profilePicture = json['profile_picture'];
    // attActive = json['date_time'];
    courses = json['courses'];
    user = LogUs.fromJson(json['user']);
    // user = ((json['user'] ?? []) as List).map((e) => LogUs.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['programme_of_study'] = programmeOfStudy;
    data['name'] = name;
    data['name'] = name;
    data['student_id'] = studentId;
    data['phone_number'] = name;
    data['year'] = year;
    data['profile_picture'] = profilePicture;
    // data['date_time'] = attActive;
    data['courses'] = courses;
    data['user'] = user;
    return data;
  }
}
