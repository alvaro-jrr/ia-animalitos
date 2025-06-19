import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ai_animals_lottery/src/app.dart';
import 'package:ai_animals_lottery/src/core/utils/flavor_settings.dart';

void main() {
  // Initialize the flavor settings.
  FlavorSettings.fromFlavor(Flavor.fromString(appFlavor ?? ''));

  runApp(const App());
}
