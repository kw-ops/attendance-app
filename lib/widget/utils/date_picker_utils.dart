// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../const/constants.dart';


class DatePickerUtil {
  static void adaptive(
    BuildContext context, {
    required Function(DateTime) onDateTimeChanged,
    bool isDateOfBirth = false,
  }) {
    Platform.isIOS
        ? cupertinoDatePicker(
            context,
            onDateTimeChanged: onDateTimeChanged,
            isDOB: isDateOfBirth,
          )
        : androidDatePicker(
            context,
            onDateTimeChanged: onDateTimeChanged,
            isDOB: isDateOfBirth,
          );
  }

  static void cupertinoDatePicker(
    BuildContext context, {
    bool isDOB = true,
    required Function(DateTime) onDateTimeChanged,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        final currentDate = DateTime.now();
        final newDate = DateTime(
          currentDate.year + 10,
          currentDate.month,
          currentDate.day,
        );
        final initialDate = DateTime(
          currentDate.year - 1,
          currentDate.month,
          currentDate.day,
        );
        return Container(
          height: 400,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              SizedBox(
                height: 350,
                child: CupertinoDatePicker(
                  minimumDate: !isDOB ? initialDate : DateTime(1947),
                  maximumDate: !isDOB ? newDate : DateTime(2004),
                  initialDateTime: !isDOB ? DateTime.now() : DateTime(2004),
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: onDateTimeChanged,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> androidDatePicker(
    BuildContext context, {
    bool isDOB = true,
    required Function(DateTime) onDateTimeChanged,
  }) async {
    final currentDate = DateTime.now();
    final newDate = DateTime(
      currentDate.year + 10,
      currentDate.month,
      currentDate.day,
    );
    final firstDate = DateTime(
      currentDate.year - 1,
      currentDate.month,
      currentDate.day,
    );
    final datetime = await showDatePicker(
      context: context,
      initialDate: !isDOB ? DateTime.now() : DateTime(2004),
      firstDate: !isDOB ? firstDate : DateTime(1947),
      lastDate: !isDOB ? newDate : DateTime(2004),
      builder: (_, __) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: appColors.blue,
            ),
          ),
          child: __!,
        );
      },
    );

    if (datetime != null) {
      onDateTimeChanged(datetime);
    }
  }

  static Future<void> showTime(
    BuildContext context, {
    required Function(String) onTimeChanged,
  }) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (_, __) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: appColors.blue,
              ),
            ),
            child: __!,
          ),
        );
      },
    );

    if (pickedTime != null) {
      DateTime parsedTime =
          DateFormat.Hm().parse(pickedTime.format(context).toString());

      String formattedTime = DateFormat('HH:mm').format(parsedTime);

      onTimeChanged(formattedTime);
    }
  }
}
