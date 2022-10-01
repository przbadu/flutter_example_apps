import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:unit_converter/date_converter/data/date_converter_repository.dart';

class DateConverterView extends ConsumerStatefulWidget {
  const DateConverterView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DateConverterViewState();
}

class _DateConverterViewState extends ConsumerState<DateConverterView> {
  TextEditingController dateInputController = TextEditingController();
  NepaliDateTime nepaliDate = NepaliDateTime.now();
  //text editing controller for text field

  @override
  Widget build(BuildContext context) {
    final dateConverterRepository = ref.watch(dateConverterRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Date converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: dateInputController,
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_month),
                labelText: 'Enter date',
              ),
              readOnly: true, // don't allow user to edit
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2200),
                );

                if (pickedDate != null) {
                  ref
                      .read(dateConverterRepositoryProvider.notifier)
                      .toNepaliDateTime(pickedDate);

                  setState(() {
                    dateInputController.text =
                        dateConverterRepository.formattedEnglishDate;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_month),
                      const SizedBox(width: 20),
                      Text(dateConverterRepository.formattedNepaliDate),
                    ],
                  ),
                ),
                const Text('B.S'),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
