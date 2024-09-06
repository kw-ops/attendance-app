import 'package:attendance/model/loginuser.dart';

class StaffModel {
  int? id;
  String? name;
  String? staffId;
  String? phoneNumber;
  String? department;
  String? profilePicture;
  List<dynamic>? courses;
  LogUs? user;

  StaffModel({
    this.id,
    this.name,
    this.staffId,
    this.phoneNumber,
    this.department,
    this.profilePicture,
    this.courses,
    this.user,
  });

  StaffModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
    name = json['name'];
    staffId = json['staff_id'];
    department = json['department'];
    profilePicture = json['profile_picture'];
    // attActive = json['date_time'];
    courses = json['courses'];
    user = LogUs.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['phone_number'] = phoneNumber;
    data['name'] = name;
    data['name'] = name;
    data['staff_id'] = staffId;
    data['department'] = department;
    data['profile_picture'] = profilePicture;
    // data['date_time'] = attActive;
    data['courses'] = courses;
    data['user'] = user;
    return data;
  }
}
