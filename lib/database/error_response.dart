class ErrorResponse {
  int? errorCode;
  String? errorMsg;

  ErrorResponse({this.errorCode, this.errorMsg});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorCode'] = errorCode;
    data['errorMsg'] = errorMsg;
    return data;
  }
}
