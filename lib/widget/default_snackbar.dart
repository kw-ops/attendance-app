import 'package:flutter/material.dart';
showSnackBar(BuildContext context, msg) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        elevation: 3.0,
        backgroundColor: Colors.black.withOpacity(0.8),
      ),
    );
}

// showGameNotification(BuildContext context, OverlayModel data) {
//   showOverlayNotification((context) {
//     Size size = MediaQuery.of(context).size;

//     return Card(
//       color: appColors.greyFBFCFC,
//       margin: EdgeInsets.fromLTRB(Dimensions().pSW(15), Dimensions().pSH(25), Dimensions().pSW(15), 0),
//       child: InkWell(
//           child: ListTile(
//             title: Text(
//               data.title,
//               style: TextStyle(
//                   fontSize: getFontSize(20, size),
//                   fontFamily: 'Architects_Daughter',
//                   color: appColors.black,
//                   fontWeight: FontWeight.bold),
//             ),
//             leading: data.leadingImage == null
//                 ? null
//                 : SvgPicture.asset(
//                     data.leadingImage ?? "",
//                     width: 32,
//                     height: 32,
//                   ), //Icon(Icons.notifications),
//             subtitle: data.subtitle == null
//                 ? null
//                 : Text(
//                     data.subtitle ?? "",
//                     style: TextStyle(
//                       fontSize: getFontSize(16, size),
//                       fontFamily: 'Architects_Daughter',
//                       color: appColors.black,
//                     ),
//                   ),
//             contentPadding: EdgeInsets.all(Dimensions().pSH(10)),
//             trailing: data.trailing,
//           ),
//           onTap: () {}),
//     );
//   }, duration: const Duration(seconds: 2));
// }
