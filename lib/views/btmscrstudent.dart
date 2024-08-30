// import 'package:attendance/const/colors.dart';
// import 'package:attendance/views/histstudent.dart';
// import 'package:attendance/views/homestu.dart';
// import 'package:attendance/views/profilescreen.dart';
// import 'package:flutter/material.dart';
// import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// class BottomScreenStudent extends StatefulWidget {
//   const BottomScreenStudent({super.key});

//   @override
//   State<BottomScreenStudent> createState() => _BottomScreenStudentState();
// }

// class _BottomScreenStudentState extends State<BottomScreenStudent> {
//   int _selectPageIndex = 1;

//   final List _page = [
//     const HistoryScreenStudent(),
//     const HomeScreenStudent(),
//     const ProfileScreen(),
//   ];

//   void _onPageSelected(int index) {
//     setState(() {
//       _selectPageIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _page[_selectPageIndex],
//       bottomNavigationBar: SalomonBottomBar(
//           backgroundColor: appColors.transparent,
//           itemPadding: const EdgeInsets.symmetric(
//             vertical: 15,
//             horizontal: 15,
//           ),
//           currentIndex: _selectPageIndex,
//           onTap: _onPageSelected,
//           items: [
//             SalomonBottomBarItem(
//               icon: const Icon(Icons.history),
//               title: const Text('History'),
//             ),
//             SalomonBottomBarItem(
//               icon: const Icon(Icons.done),
//               title: const Text('Attendance'),
//             ),
//             SalomonBottomBarItem(
//               icon: const Icon(Icons.person),
//               title: const Text('Profile'),
//             ),
//           ]),
//     );
//   }
// }
