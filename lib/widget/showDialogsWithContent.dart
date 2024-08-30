// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../const/constants.dart';
import 'app_text_widget.dart';
import 'main_button.dart';


Future<void> showMessageWithContent(
{
  BuildContext? context,
  String? headerMessage,
  String? message,
  Widget? content,
  required Function onTapYes,
  required Function onTapNo
}

) async {
  Dimensions.init(context!);
  if (!Platform.isIOS) {
    await showDialog<bool>(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: AppTextWidget(
              text: headerMessage ??'System Message',
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontsize: 19,
            ),
            content: content ?? AppTextWidget(
              text: message ?? "Type Something",
              color: appColors.black,
              fontWeight: FontWeight.w400,
              fontsize: 14,
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainButton(
                    onTap: () {
                    Navigator.pop(context);
                    }, mainColor: appColors.white,
                    strokeColor: appColors.blue,
                    strokeWidth: 0.6,
                    labelColor: appColors.blue,
                    label: "No",
                    width: Dimensions.getProportionateScreenWidth(100),
                    height: Dimensions.getProportionateScreenHeight(50),
                  ),

                  MainButton(
                    onTap: () {
                      Navigator.pop(context);
                      onTapYes();
                    }, mainColor: appColors.blue,
                    label: "Yes",
                    width: Dimensions.getProportionateScreenWidth(100),
                    height: Dimensions.getProportionateScreenHeight(50),
                  ),
                ],
              )

            ],
          );
        });
  } else {
    await showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title:  AppTextWidget(
          text: headerMessage ??'System Message',
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontsize: 19,
        ),
        content: content ??  AppTextWidget(
          text: message?? "Type Something",
          color: appColors.black,
          fontWeight: FontWeight.w400,
          fontsize: 14,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainButton(
                onTap: () {
                  Navigator.pop(context);
                }, mainColor: appColors.white,
                strokeColor: appColors.blue,
                strokeWidth: 0.6,
                labelColor: appColors.blue,
                label: "No",
                width: Dimensions.getProportionateScreenWidth(100),
                height: Dimensions.getProportionateScreenHeight(50),
              ),

              MainButton(
                onTap: () {
                  onTapYes();
                }, mainColor: appColors.blue,
                label: "Yes",
                width: Dimensions.getProportionateScreenWidth(100),
                height: Dimensions.getProportionateScreenHeight(50),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// remove custom laoding indicator
///info: i think using this method is not safe and loading states should be instead handled by viewmodels
void hideLoader(BuildContext context) {
  Navigator.of(context).pop();
}

// // copy to clipboard
// void copyToClipboard(BuildContext context, String number) {
//   Clipboard.setData(
//     ClipboardData(text: number),
//   ).then((value) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         backgroundColor: appColors.green,
//         content: AppTextWidget(
//           text: 'Copied to clipboard.',
//           fontsize: 12,
//           fontWeight: FontWeight.w500,
//           color: appColors.white,
//         ),
//       ),
//     );
//   });
// }

// // PopupMenuItem for PopupMenuButton
// PopupMenuItem<dynamic> popupItem({
//   required String title,
//   required Function() onTap,
//   Color? textColor,
// }) {
//   return PopupMenuItem(
//     onTap: onTap,
//     child: Text(
//       title,
//       style: TextStyle(
//         color: textColor ?? appColors.grey6A7187,
//         fontSize: 14,
//         fontWeight: FontWeight.w500,
//       ),
//     ),
//   );
// }
