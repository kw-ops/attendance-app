class HistoryModel {
  String? date;
  String? time;
  bool? attend;

  HistoryModel({
    required this.date,
    required this.time,
    required this.attend,
  });

  HistoryModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    attend = json['attend'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['time'] = time;
    data['attend'] = attend;
    return data;
  }
}