import 'package:attendance/model/history.dart';

class CoursesModel {
  String? image;
  String? courseCode;
  bool? attActive;
  List<HistoryModel>? state;
  bool isExpanded = false;

  CoursesModel({
    this.image,
    this.courseCode,
    this.attActive,
    this.state,
    this.isExpanded = false,
  });

  CoursesModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    courseCode = json['transaction_type'];
    attActive = json['date_time'];
    state = ((json['state']) as List)
        .map((e) => HistoryModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['transaction_type'] = courseCode;
    data['date_time'] = attActive;
    data['state'] = state;
    return data;
  }
}
