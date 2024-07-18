import 'package:flutter/material.dart';

import '../const/constants.dart';

class WaitDialog extends StatefulWidget {
  final String message;
  const WaitDialog({Key? key, required this.message}) : super(key: key);

  @override
  State<WaitDialog> createState() => _WaitDialogState();
}

class _WaitDialogState extends State<WaitDialog> {
  @override
  Widget build(BuildContext context) {
    Brightness _bright = Theme.of(context).brightness;
    Dimensions.init(context);
    return AlertDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.all(10),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: _bright == Brightness.dark
            ? appColors.background
            : appColors.armyGreen,
        key: const ValueKey('modalKey'),
        content: SizedBox(
          height: Dimensions().pSH(300),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.message, style: TextStyle(fontSize: Dimensions().pSH(16))),
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: Dimensions().pSH(10),
                ),
                Text("Please wait....", style: TextStyle(fontSize: Dimensions().pSH(16)))
              ],
            ),
          ),
        ));
  }
}
