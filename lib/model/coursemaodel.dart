import 'package:attendance/model/staff_model.dart';
import 'package:attendance/model/student_model.dart';

class CoursesModel {
  int? id;
  String? name;
  String? courseCode;
  bool? active;
  bool? isExpanded;
  List<StudentModel>? students;
  // List<Attend>? attendances;
  StaffModel? lecturer;

  CoursesModel({
    this.id,
    this.name,
    this.courseCode,
    this.active,
    this.isExpanded,
    this.students,
    // this.attendances,
    this.lecturer,
  });

  CoursesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    courseCode = json['course_code'];
    students = ((json['students']) as List)
        .map((e) => StudentModel.fromJson(e))
        .toList();
    // attendances = ((json['attendances']) as List)
    //     .map((e) => Attend.fromJson(e))
    //     .toList();
    lecturer = StaffModel.fromJson(json['lecturer']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['course_code'] = courseCode;
    data['students'] = students;
    // data['attendances'] = attendances;
    data['lecturer'] = lecturer;
    return data;
  }
}
