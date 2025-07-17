import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ai_animals_lottery/src/app.dart';
import 'package:ai_animals_lottery/src/core/utils/flavor_settings.dart';
import 'package:ai_animals_lottery/src/core/widgets/app_providers.dart';
import 'package:ai_animals_lottery/src/di.dart' as di;

void main() {
  // Initialize the flavor settings.
  FlavorSettings.fromFlavor(Flavor.fromString(appFlavor ?? ''));

  /// Initialize the dependencies.
  di.init();

  runApp(const AppProviders(child: App()));
}
