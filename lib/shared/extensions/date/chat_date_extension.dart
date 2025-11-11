import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ChatDateExtension on DateTime {
  String bubbleTimeFormat(BuildContext context, {DateTime? fromTime}) {
    final fromDateTime = fromTime ?? DateTime.now();

    final from = DateTime(
      fromDateTime.year,
      fromDateTime.month,
      fromDateTime.day,
    );
    final thatDay = DateTime(year, month, day);
    final dayDiff = from.difference(thatDay).inDays;

    final use24h = MediaQuery.of(context).alwaysUse24HourFormat;
    final timePattern = use24h ? "HH:mm" : "h:mm a";
    final timeStr = DateFormat(timePattern).format(this);

    if (dayDiff == 0) {
      return timeStr;
    } else if (dayDiff == 1) {
      return "Yesterday, $timeStr";
    } else {
      return DateFormat('d MMM yyyy').format(this);
    }
  }
}
