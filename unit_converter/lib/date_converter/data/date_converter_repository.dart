import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:unit_converter/date_converter/domain/date_converter.dart';

class DateConverterRepository extends StateNotifier<DateConverter> {
  DateConverterRepository() : super(DateConverter.init());

  DateConverter toNepaliDateTime(DateTime date) {
    final nepaliDate = date.toNepaliDateTime();
    state = DateConverter(nepalidDate: nepaliDate, englishDate: date);
    return state;
  }

  DateConverter toDateTime(NepaliDateTime date) {
    final englishDate = date.toDateTime();
    state = DateConverter(nepalidDate: date, englishDate: englishDate);
    return state;
  }
}

final dateConverterRepositoryProvider =
    StateNotifierProvider.autoDispose<DateConverterRepository, DateConverter>(
        (ref) {
  return DateConverterRepository();
});

// final toNepaliDateTimeProvider = StateNotifierProvider.autoDispose
//     .family<void, DateConverter, DateTime>((ref, date) {
//   return ref
//       .watch(dateConverterRepositoryProvider.notifier)
//       .toNepaliDateTime(date);
// });

// final toenglishDateTimeProvider = StateNotifierProvider.autoDispose
//     .family<void, DateConverter, NepaliDateTime>((ref, date) {
//   return ref.watch(dateConverterRepositoryProvider.notifier).toDateTime(date);
// });
