import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todoapp/app/tasks/presentation/tasks_controller.dart';
import 'package:todoapp/app/tasks/presentation/widgets/task_list_widget.dart';
import 'package:todoapp/config/config.dart';
import 'package:todoapp/widgets/async_value_widget.dart';

class UpcomingTaskListPage extends ConsumerStatefulWidget {
  const UpcomingTaskListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpcomingTaskListPageState();
}

class _UpcomingTaskListPageState extends ConsumerState<UpcomingTaskListPage> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final tasksController = ref.watch(tasksControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TableCalendar(
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: kCalendarTheme(context),
            focusedDay: _focusedDay,
            firstDay: _focusedDay.subtract(const Duration(days: 120)),
            lastDay: _focusedDay.add(const Duration(days: 365)),
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
          ),
          Expanded(
            child: AsyncValueWidget(
              value: tasksController,
              data: (tasks) => TaskListWidget(
                tasks: tasks,
                shrinkWrap: false,
                physics: const ScrollPhysics(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
