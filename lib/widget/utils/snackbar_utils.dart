import 'package:flutter/material.dart';

class SnackbarUtils {
  SnackbarUtils._(this.cxt);

  factory SnackbarUtils.of(BuildContext context) {
    return SnackbarUtils._(context);
  }

  final BuildContext cxt;

  void errorSnackBar(String message, [bool isError = true]) {
    ScaffoldMessenger.of(cxt).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
