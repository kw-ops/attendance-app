class Users {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;

  Users({
    required this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
  });

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'] ;
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    return data;
  }
}
