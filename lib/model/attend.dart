// import 'package:attendance/model/coursemaodel.dart';

class Attend {
  // int? id;
  // bool? isActive;
  // DateTime? generatedAt;
  String? date;
  // DateTime? expiresAt;
  // String? token;
  // CoursesModel? course;

  Attend({
    // this.id,
    // this.isActive,
    // this.generatedAt,
    this.date,
    // this.expiresAt,
    // this.token,
    // this.course,
  });

  Attend.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    // isActive = json['isActive'] ;
    // expiresAt = json['expires_at'] ?? '';
    date = json['date'] ?? '';
    // generatedAt = json['generated_at'];
    // token = json['token'];
    // course = CoursesModel.fromJson(json['course']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    // data['isActive'] = isActive;
    // data['generated_at'] = generatedAt;
    // data['token'] = token;
    // data['expires_at'] = expiresAt;
    data['date'] = date;
    // data['course'] = course;
    return data;
  }
}
