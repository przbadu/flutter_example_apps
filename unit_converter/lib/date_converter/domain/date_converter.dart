import 'package:intl/intl.dart';
import 'package:nepali_utils/nepali_utils.dart';

class DateConverter {
  NepaliDateTime? nepaliDate;
  DateTime? englishDate;
  final String format = 'yyyy/MM/dd';

  DateConverter({required nepalidDate, required englishDate});

  /// string formatted date for selected [nepaliDate]
  ///    e.g: '2079/06/07'
  String get formattedNepaliDate {
    if (nepaliDate != null) {
      return NepaliDateFormat(format).format(nepaliDate!);
    }
    return NepaliDateFormat(format).format(NepaliDateTime.now());
  }

  /// string formatted date for selected [englishDate]
  /// e.g: '2022/09/23'
  String get formattedEnglishDate {
    if (englishDate != null) {
      DateFormat(format).format(englishDate!);
    }
    return DateFormat(format).format(DateTime.now());
  }

  /// Initial [Date] is set to today's date
  factory DateConverter.init() => DateConverter(
        nepalidDate: NepaliDateTime.now(),
        englishDate: DateTime.now(),
      );
}
