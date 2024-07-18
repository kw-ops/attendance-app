import 'dart:ffi';

class UserLocation {
  final double? latitude;
  final double? longitude;

  UserLocation({
   this.latitude,
   this.longitude,
  });

  // UserLocation.fromJson(Map<String, dynamic> json) {
  //   latitude = json['latitude'];
  //   longitude = json['longitude'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['latitude'] = latitude;
  //   data['longitude'] = longitude;
  //   return data;
  // }
}