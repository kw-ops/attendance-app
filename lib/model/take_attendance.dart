import 'coursemaodel.dart';

class TakeAttendance {
  int? id;
  List<CoursesModel>? course;
  String? generatedAt;
  String? expiresAt;
  String? token;

  TakeAttendance({
    required this.id,
    this.course,
    this.generatedAt,
    this.expiresAt,
    this.token,
  });

  TakeAttendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    course = ((json['course']) as List)
        .map((e) => CoursesModel.fromJson(e))
        .toList();
    generatedAt = json['generated_at'];
    expiresAt = json['expires_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['course'] = course;
    data['generated_at'] = generatedAt;
    data['expires_at'] = expiresAt;
    data['token'] = token;
    return data;
  }
}
