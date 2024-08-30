import 'package:attendance/model/coursemaodel.dart';
import 'package:attendance/model/loginuser.dart';
import 'package:attendance/model/users.dart';

class HistoryAttendance {
  int? id;
  String? date;
  String? time;
  List<CoursesModel>? course;
  List<LogUs>? presentStudents;
  List<LogUs>? missedStudents;
  bool isExpanded = false;

  HistoryAttendance({
    required this.id,
    this.date,
    this.time,
    this.course,
    this.presentStudents,
    this.missedStudents,
    this.isExpanded = false,
  });

  HistoryAttendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    // attActive = json['date_time'];
    course = ((json['course']) as List)
        .map((e) => CoursesModel.fromJson(e))
        .toList();
    presentStudents = ((json['present_students']) as List)
        .map((e) => LogUs.fromJson(e))
        .toList();
    missedStudents = ((json['present_students']) as List)
        .map((e) => LogUs.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['time'] = time;
    // data['date_time'] = attActive;
    data['course'] = course;
    data['present_students'] = presentStudents;
    data['missed_students'] = missedStudents;
    return data;
  }
}
