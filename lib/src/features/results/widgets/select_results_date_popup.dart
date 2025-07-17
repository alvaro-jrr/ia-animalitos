import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:ai_animals_lottery/src/app.dart';
import 'package:ai_animals_lottery/src/features/results/results_provider.dart';

class SelectResultsDatePopup extends StatelessWidget {
  const SelectResultsDatePopup({super.key});

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);

    return Selector<
      ResultsProvider,
      ({DateTime selectedDate, ResultDates dates})
    >(
      selector: (_, provider) {
        return (selectedDate: provider.selectedDate, dates: provider.dates);
      },
      builder: (context, data, child) {
        final selectedDate = data.selectedDate;
        final dates = data.dates;
        final isToday = selectedDate == dates.today;

        return PopupMenuButton(
          onSelected: (date) {
            context.read<ResultsProvider>().selectDate(date);
          },
          itemBuilder: (context) => [
            CheckedPopupMenuItem(
              value: dates.today,
              checked: isToday,
              child: Text(localization.today),
            ),
            CheckedPopupMenuItem(
              value: dates.yesterday,
              checked: selectedDate == dates.yesterday,
              child: Text(localization.yesterday),
            ),
          ],
          icon: Row(
            children: [
              Text(
                '${isToday ? localization.today : localization.yesterday}, ${DateFormat.Md().format(selectedDate)}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: iconTheme.color,
                ),
              ),
              const SizedBox(width: 8.0),
              Icon(Icons.calendar_today),
            ],
          ),
        );
      },
    );
  }
}
