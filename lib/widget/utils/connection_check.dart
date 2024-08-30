// import 'dart:async';
// import 'dart:developer';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/services.dart';

// class ConnectionCheck {
//   ConnectivityResult _connectionStatus = ConnectivityResult.none;
//   final Connectivity _connectivity = Connectivity();

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initConnectivity() async {
//     late ConnectivityResult result;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       result = await _connectivity.checkConnectivity();
//     } on PlatformException catch (e) {
//       log('Couldn\'t check connectivity status', error: e);
//       return;
//     }
//     _connectionStatus = result;
//     return;
//   }

//    Future<bool> hasConnection() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     return connectivityResult == ConnectivityResult.mobile ||
//         connectivityResult == ConnectivityResult.wifi;
//   }

//    ConnectivityResult connectivityResult(){
//     return _connectionStatus;
//    }
// }
// void main() async {
//   ConnectionCheck connectionCheck = ConnectionCheck();

//   // Initialize connectivity check
//   await connectionCheck.initConnectivity();

//   // Check if there is a connection
//   bool isConnected = await connectionCheck.hasConnection();
//   print('Is connected: $isConnected');

//   // Get the connectivity result
//   ConnectivityResult Function() result = connectionCheck.connectivityResult;
//   print('Connectivity Result: $result');
// }

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternetConnectivity() async {
  ConnectivityResult connectivityResult;
  
  // Step 1: Check for network availability
  try {
    connectivityResult = (await Connectivity().checkConnectivity()) as ConnectivityResult;
  } catch (e) {
    // Handle any exception thrown by Connectivity
    print('Error checking connectivity: $e');
    return false;
  }

  // If there's no network connection, return false
  if (connectivityResult == ConnectivityResult.none) {
    return false;
  }

  // Step 2: Check if internet is actually reachable
  try {
    // Perform a simple HTTP request to a reliable site
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } catch (e) {
    // Handle any error that might occur during the lookup
    print('Error performing lookup: $e');
    return false;
  }

  return false;
}