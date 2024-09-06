import 'package:attendance/model/attend.dart';

class HistoryAttendance {
  String? courseCode;
  bool isExpanded = false;
  List<Attend>? attendances;

  HistoryAttendance({
    this.courseCode,
    required this.isExpanded,
    this.attendances,
  });

  HistoryAttendance.fromJson(Map<String, dynamic> json) {
    courseCode = json['course_code'];
    attendances = ((json['attendances']) as List)
        .map((e) => Attend.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['course_code'] = courseCode;
    data['attendances'] = attendances;
    return data;
  }
}
