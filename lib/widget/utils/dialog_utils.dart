import 'package:flutter/material.dart';

class DialogUtils {
  DialogUtils._(this.cxt);

  factory DialogUtils.of(BuildContext context) {
    return DialogUtils._(context);
  }

  final BuildContext cxt;

  showCircleLoader([bool isDimissable = false]) {
    return showDialog(
      barrierDismissible: isDimissable,
      context: cxt,
      useRootNavigator: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
