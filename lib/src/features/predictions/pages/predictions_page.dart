import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/app.dart';

class PredictionsPage extends StatelessWidget {
  const PredictionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(localization.predictions));
  }
}
