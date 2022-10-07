import 'package:intl/intl.dart';

String dateFormat(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = DateTime(now.year, now.month, now.day - 1);
  final tomorrow = DateTime(now.year, now.month, now.day + 1);

  final givenDate = DateTime(date.year, date.month, date.day);

  if (givenDate == today) {
    return 'Today';
  } else if (givenDate == yesterday) {
    return 'Yesterday';
  } else if (givenDate == tomorrow) {
    return 'Tomorrow';
  } else {
    return DateFormat.MMMd().format(date);
  }
}
