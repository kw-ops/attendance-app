import 'package:attendance/views/historyscr/histstaff.dart';
import 'package:attendance/views/homescr/homestaff.dart';
import 'package:attendance/views/profilescr/profstaff.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../const/colors.dart';

class BottomScreenStaff extends StatefulWidget {
  const BottomScreenStaff({super.key});

  @override
  State<BottomScreenStaff> createState() => _BottomScreenStaffState();
}

class _BottomScreenStaffState extends State<BottomScreenStaff> {
  @override
   int _selectPageIndex = 1;

  final List _page = [
    const HistoryStaff(),
    const HomeStaffScreen(),
    const ProfileStaff(),
  ];

  void _onPageSelected(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectPageIndex],
      bottomNavigationBar: SalomonBottomBar(
          backgroundColor: appColors.transparent,
          itemPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          currentIndex: _selectPageIndex,
          onTap: _onPageSelected,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.history),
              title: const Text('History'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.done),
              title: const Text('Attendance'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Profile'),
            ),
          ]),
    );
  }
}