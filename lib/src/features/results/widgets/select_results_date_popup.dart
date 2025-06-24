import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

import 'package:ai_animals_lottery/src/app.dart';
import 'package:ai_animals_lottery/src/features/results/results_provider.dart';

class SelectResultsDatePopup extends StatelessWidget {
  const SelectResultsDatePopup({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final data = context
        .select<ResultsProvider, ({DateTime selectedDate, ResultDates dates})>(
          (provider) =>
              (selectedDate: provider.selectedDate, dates: provider.dates),
        );

    final selectedDate = data.selectedDate;
    final dates = data.dates;
    final isToday = selectedDate == dates.today;
    final isYesterday = selectedDate == dates.yesterday;

    return PopupMenuButton(
      tooltip: localization.selectResultsDate,
      itemBuilder: (context) {
        return [
          CheckedPopupMenuItem(
            checked: isToday,
            onTap: () => _onSelectDate(context, dates.today),
            child: Text(localization.today),
          ),
          CheckedPopupMenuItem(
            checked: isYesterday,
            onTap: () => _onSelectDate(context, dates.yesterday),
            child: Text(localization.yesterday),
          ),
        ];
      },
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isToday || isYesterday
                ? '${isToday ? localization.today : localization.yesterday}, ${DateFormat.Md().format(selectedDate)}'
                : DateFormat.Md().format(selectedDate),
            style: TextStyle(color: theme.colorScheme.onPrimary),
          ),
          const SizedBox(width: 6.0),
          Icon(Icons.calendar_today),
        ],
      ),
    );
  }

  /// Selects the [date].
  void _onSelectDate(BuildContext context, DateTime date) {
    context.read<ResultsProvider>().selectDate(date);
  }
}
