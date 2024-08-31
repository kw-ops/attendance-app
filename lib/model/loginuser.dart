class LogUs {
  int? id;
  String? username;
  String? password;
  String? email;
  String? firstName;
  String? lastName;
  String? token;
  String? staffId;

  LogUs({
    this.id,
    this.username,
    this.password,
    this.email,
    this.firstName,
    this.lastName,
    this.token,
    this.staffId,
  });

  LogUs.fromJson(Map<String, dynamic> json) {
    id = json['user_id'];
    username = json['username'] ;
    email = json['email'];
    password = json['password'];
    token = json['token'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    staffId = json['staff_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['token'] = token;
    data['email'] = email;
    data['staff_Id'] = staffId;
    return data;
  }
}
