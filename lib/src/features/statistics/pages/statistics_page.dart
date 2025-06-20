import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/app.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(localization.statistics));
  }
}
