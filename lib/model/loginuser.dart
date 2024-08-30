class LogUs {
  int? id;
  String? username;
  String? password;
  String? token;
  String? staffId;

  LogUs({
    this.id,
    this.username,
    this.password,
    this.token,
    this.staffId,
  });

  LogUs.fromJson(Map<String, dynamic> json) {
    id = json['user_id'];
    username = json['username'] ;
    password = json['password'];
    password = json['password'];
    token = json['token'];
    password = json['password'];
    staffId = json['staff_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['token'] = token;
    data['password'] = password;
    data['staff_Id'] = staffId;
    return data;
  }
}
