// import 'dart:async';
// import 'dart:ffi';
import 'package:location/location.dart';
// import '../../model/location.dart';

class LocationService {
  // UserLocation? _currentLocation;

  // Location location = Location();

  // // StreamController<UserLocation> _locationController =
  // //     StreamController<UserLocation>.broadcast();

  // // Stream<UserLocation> get locationStream => _locationController.stream;

  // // LocationService() {
  // //   // Request permission to use location
  // //   location.requestPermission().then((granted) {
  // //     if (granted == PermissionStatus.granted) {
  // //       // If granted listen to the onLocationChanged stream and emit over our controller
  // //       location.onLocationChanged.listen(
  // //         (locationData) {
  // //           _locationController.add(
  // //             UserLocation(
  // //               latitude: locationData.latitude.toString(),
  // //               longitude: locationData.longitude.toString(),
  // //             ),
  // //           );
  // //         },
  // //       );
  // //     }
  // //   });
  // // }

  // Future<UserLocation?> getLocation() async {
  //   try {
  //     LocationData userLocation = await location.getLocation();
  //     _currentLocation = UserLocation(
  //       latitude: userLocation.latitude,
  //       longitude: userLocation.longitude,
  //     );
  //   } on Exception catch (e) {
  //     print('Could not get location: ${e.toString()}');
  //   }

  //   return _currentLocation;
  // }

  Location location = Location();

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  Future<dynamic?> getLocation() async {
    try {
    _serviceEnabled = await location.serviceEnabled();
    if (_serviceEnabled==false) {
      _serviceEnabled = await location.requestService();
      if (_serviceEnabled==false) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }
    

    _locationData = await location.getLocation();
  }
}
