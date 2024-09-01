import 'package:attendance/model/coursemaodel.dart';
import 'package:attendance/model/staff_model.dart';
import 'package:attendance/model/student_model.dart';

class Attend {
  int? id;
  CoursesModel? course;
  StaffModel? lecturer;
  List<StudentModel>? student;
  String? presentUser;
  String? absentUser;
  String? active;
  String? token;
  String? generatedAt;
  String? ExpiresAt;

  Attend({
    this.id,
    this.course,
    this.lecturer,
    this.student,
    this.presentUser,
    this.absentUser,
    this.active,
    this.token,
    this.generatedAt,
  });

  Attend.fromJson(Map<String, dynamic> json) {
    id = json['user_id'];
    course = json['course'];
    student = json['student'] ?? '';
    lecturer = json['lecturer'];
    active = json['active'];
    active = json['active'];
    token = json['token'];
    presentUser = json['first_name'] ?? '';
    absentUser = json['last_name'] ?? '';
    generatedAt = json['staff_id'];
    generatedAt = json['staff_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = id;
    data['course'] = course;
    data['lecturer'] = lecturer;
    data['first_name'] = presentUser;
    data['last_name'] = absentUser;
    data['active'] = active;
    data['active'] = active;
    data['token'] = token;
    data['student'] = student;
    data['staff_Id'] = generatedAt;

    return data;
  }
}
